##2017-09-20 - Release - 1.3.2
###Summary
Added option to choose whether to install unzip or not.
Note that the install_unzip parameter is supported both in Puppet 3 and 4/5.

##2016-07-12 - Release - 1.3.1
###Summary
Added Debian, RedHat and CentOS distributions as supported.
Removed restriction on specific Ubuntu versions.

##2016-07-12 - Release - 1.3.0
###Summary
Added capability to uncompress jar file by using the unzip command.
Added -o option to unzip in order to overwrite existing files.
Added optional parameter to allow passing specific options to the wget command.

##2015-08-25 - Release - 1.2.0
###Summary
Introduces dependency from stdlib in order to make use of ensure_packages to ensure package unzip is installed.
Furthermore, specifies the path where to search for the commands used (no more error in case they are not set as global defaults in the site.pp).

##2015-06-8 - Release - 1.1.1
###Summary
Fix the fact the hiera key `distributions_base_url` is optional when `download_base_url` is specified or `distribution_name`begins with `http://`.
A Puppet error is raised if none of these conditions is satisfied.

##2015-06-8 - Release - 1.1.0
###Summary
Allow to specify full URL as `distribution_name` in which case the parameter `download_base_url` is ignored.

##2015-04-30 - Release - 1.0.3
###Summary
Improved documentation, rspec tests added, license changed from CC-BY-SA-4.0 to Apache-2.0.

##2015-04-27 - Release - 1.0.2
###Summary
Code polishing to be more compliant with puppet-lint suggestions.

####Bugfixes
Corrected dependency name.

##2015-04-22 - Release - 1.0.1
###Summary
Code polishing to be more compliant with puppet-lint suggestions.

##2015-04-21 - Release - 1.0.0
###Summary
Initial release as PuppetForge module.

####Features
See the README.markdown

####Bugfixes

####Known bugs
* No known bugs
