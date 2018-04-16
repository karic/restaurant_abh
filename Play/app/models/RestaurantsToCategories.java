package models;

import play.*;
import play.db.*;
import play.db.jpa.*;
import play.db.jpa.JPA;
import play.mvc.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

import java.util.ArrayList;
import java.util.List;

import java.util.Collections;
import static play.data.Form.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="restaurantstocategories")
public class RestaurantsToCategories {
    @Id @GeneratedValue long id;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="idrestaurant")
    @JsonIgnore
    private Restaurant restaurant;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="idcategory")
    @JsonIgnore
    private RestaurantCategories category;




    public RestaurantsToCategories() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public RestaurantCategories getCategory() {
        return category;
    }

    public void setCategory(RestaurantCategories category) {
        this.category = category;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public void save() { JPA.em().persist(this); }

    public void update() { JPA.em().merge(this); }

    public void delete() {
        JPA.em().remove(this);
    }

    @Transactional
    public static List<Long> getRestaurantCategoriesIds(long idRestaurant){
        try {
            TypedQuery<RestaurantsToCategories> query = JPA.em().createQuery("SELECT u FROM RestaurantsToCategories u WHERE idRestaurant = ?", RestaurantsToCategories.class);
            query.setParameter(1, idRestaurant);
            List<RestaurantsToCategories> categories = query.getResultList();

            List<Long> idCategories = new ArrayList();
            for (int i = 0; i < categories.size(); i++) {
                idCategories.add(categories.get(i).getCategory().getId());
            }

            return idCategories;
        } catch(NoResultException noresult) { //If there is no user with
            return null;
        }
    }

    @Transactional
    public static void addUpdateRestaurantCategories(List<Long> newCategoriesArray, long idRestaurant){

        //Get current categories for this restaurant
        List<Long> currentRestaurantCategories = getRestaurantCategoriesIds(idRestaurant);

        System.out.println("----------------------------------");
        System.out.println(currentRestaurantCategories);
        System.out.println(newCategoriesArray);
        System.out.println("----------------------------------");

        List<Long> toAdd = new ArrayList(newCategoriesArray);
        toAdd.removeAll(currentRestaurantCategories);
        System.out.println("ITEMS TO ADD-----------------");
        System.out.println(toAdd);

        //Loop through categories to add
        for(int i=0; i<toAdd.size(); i++){
            RestaurantsToCategories newEntry = new RestaurantsToCategories();
            newEntry.setRestaurant(Restaurant.findById(idRestaurant));
            newEntry.setCategory(RestaurantCategories.findById(toAdd.get(i)));
            newEntry.save();
        }

        List<Long> toRemove = new ArrayList(currentRestaurantCategories);
        toRemove.removeAll(newCategoriesArray);
        System.out.println("ITEMS TO REMOVE-----------------");
        System.out.println(toRemove);

        //Loop through categories to remove
        for(int i=0; i<toRemove.size(); i++){
            RestaurantsToCategories newEntry = new RestaurantsToCategories();
            newEntry = newEntry.findByIdCategoryAndIdRestaurant(toRemove.get(i), idRestaurant);
            newEntry.delete();
        }

    }

    @Transactional
    public static RestaurantsToCategories findByIdCategoryAndIdRestaurant(long idCategory, long idRestaurant){
        try {
            TypedQuery<RestaurantsToCategories> query = JPA.em().createQuery("SELECT u FROM RestaurantsToCategories u WHERE idCategory = ? AND idRestaurant = ?", RestaurantsToCategories.class);
            query.setParameter(1, idCategory);
            query.setParameter(2, idRestaurant);
            RestaurantsToCategories restauranttocategory = query.getSingleResult();

            return restauranttocategory;
        } catch(NoResultException noresult) { //If there is no user with
            return null;
        }
    }
}
