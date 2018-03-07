#download_uncompress

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with download_uncompress](#setup)
    * [What download_uncompress affects](#what-download_uncompress-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with download_uncompress](#beginning-with-download_uncompress)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This is the download_uncompress module. It allows to download and uncompress a software distribution in a specified directory.

##Module Description

The module provides a utility define that takes care to download and uncompress a software distribution in a specified directory. The software distribution can be uncompressed with unzip or untar or leaved as it is. The operations are performed only if the expected file or folder does not yet exists.

##Setup

###What download_uncompress affects

The module installs the `unzip` package if it is not installed using stdlib `ensure_packages` type.

The module performs a wget from the specified url into the `/tmp` directory and possibly unzip the downloaded file into the destination folder. The *base_url* from which to download can be provided as a parameter and defaults to the value of the key `distributions_base_url` defined in hiera.

###Setup Requirements

This modules requires the following other modules to be installed:

* puppetlabs/stdlib

    to use the `ensure_packages` resource.
	
###Beginning with download_uncompress	

To download and unzip SoftwareXY.zip from the base url specified by the key `distributions_base_url` defined in hiera, it is possible to use a declaration as the following:

```
download_uncompress {'dwnl_inst_swxy':
   download_base_url  => "http://jee.invallee.it/dist",
   distribution_name  => "SoftwareXY.zip"
   dest_folder   => '/tmp',
   creates       => "/tmp/SXYInstallFolder",
   uncompress    => 'tar.gz',
}
```

##Usage

It is convenient to specify via hiera the default bae url to be used to download software distributions; typically it would be some kind of internal repository where software binary packages are made available. An example hiera (JSON) declaration would be as follows:

```
{
  "distributions_base_url" : "http://site.x.y/dist"
}
```

Then, a typical declaration would be:
```
  download_uncompress { 'install_jboss_5':
    distribution_name => 'jboss-5.1.0.GA-jdk6.zip',
    dest_folder       => '/opt',
    creates           => '/opt/jboss-5.1.0.GA',
    uncompress        => 'zip',
    user              => jboss,
    group             => jboss,
  }
```

Alternatively, the base url can be given as a parameter:
```
  download_uncompress { "install_jboss-4.2.3.GA":
    download_base_url => "http://sourceforge.net/projects/jboss/files/JBoss",
    distribution_name => "JBoss-4.2.3.GA/jboss-4.2.3-jdk6.zip/download",
    dest_folder       => "/opt",
    creates           => "/opt/jboss-4.2.3.GA",
    uncompress        => 'zip',
    user              => jboss,
    group             => jboss,
  }
```

Or, the full url can be specified in one place:
```
  download_uncompress { "install_jboss-4.2.3.GA":
    distribution_name => "http://sourceforge.nt/projects/jboss/files/JBoss/JBoss-4.2.3.GA/jboss-4.2.3-jdk6.zip/download",
    dest_folder       => "/opt",
    creates           => "/opt/jboss-4.2.3.GA",
    uncompress        => 'zip',
    user              => jboss,
    group             => jboss,
  }
```

Another example, to put in place a JBoss library (no uncompression in this case):
```
  download_uncompress { "${postgresqlModulePath}/postgresql-9.1-903.jdbc4.jar":
    distribution_name => 'lib/postgresql-9.1-903.jdbc4.jar',
    dest_folder       => "${postgresqlModulePath}",
    creates           => "${postgresqlModulePath}/postgresql-9.1-903.jdbc4.jar",
    user              => jboss,
    group             => jboss,
  }
```

##Reference

###Public Defines

* [`download_uncompress::download_uncompress`](#download_uncompressdownload_uncompress): Downloads and possibly uncompress a file from a given url to a specified destination folder

###Private Classes

* [`download_uncompress::dependencies`](#download_uncompressdependencies): Install dependencies needed for the module, specifically the package `unzip`

###`download_uncompress::download_uncompress`
Downloads and possibly uncompress a file from a given url to a specified destination folder.

####Parameters

#####`download_base_url`
Base URL from which to download.
Defaults to the `distributions_base_url` key defined in hiera.

#####`distribution_name`
Name of the distribution to download or full URL, in which case the parameter `download_base_url` is ignored.

#####`dest_folder`
Destination folder where to unzip (or possibly only download) the distribution.

#####`creates`
Folder created after downloading and possibly unzipping, useful to make the resource type idempotent.

#####`uncompress`
Specify the type of compression used by the distribution or if no uncompression is needed.
Possible values are `zip`, `tar.gz`, `jar`. Any other value is interpreted as no uncompression needed.
Defaults to `false`.

#####`user`
user to be used when performing the download and the eventual uncompression.
Defaults to `root`.

#####`group`
group to be used when performing the download and the eventual uncompression.
Defaults to `root`.

#####`install_unzip`
Choose whether to install unzip or not.
Defaults to `true`.

#####`wget_options`
options to pass to the wget command.
Defaults to the empty string.

##Limitations

At the moment the module targets only OpenJDK on Ubuntu platforms. Specifically, it is tested only on Ubuntu 10.04, 12.04, and 14.04 distributions, although probably it will work also on more recent versions.

##Development

If you need some feature please send me a (pull) request or send me an email at: dsestero 'at' gmail 'dot' com.

