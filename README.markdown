# Requirements

# Installation

  puppet module install evenup/skeleton

# Synopsis

# Parameters

- *enable*

# License

  See LICENSE

# Contact


# Support

Please log tickets and issues at our [Projects site](https://github.com/evenup/evenup-skeleton)





# Skeleton
[![Build Status](https://travis-ci.org/evenup/evenup-skeleton.png?branch=master)](https://travis-ci.org/evenup/evenup-skeleton)

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [Resources managed by skeleton module](#resources-managed-by-skeleton-module)
    * [Setup requirements](#setup-requirements)
    * [Beginning with module skeleton](#beginning-with-module-skeleton)
4. [Usage](#usage)
5. [Operating Systems Support](#operating-systems-support)
6. [Development](#development)

##Overview

This module installs, manages and configures skeleton.

##Module Description

This is the skeleton module


##Setup

###Resources managed by skeleton module
* This module installs the skeleton package
* Enables the skeleton service
* Can manage all the configuration files (by default no file is changed)

###Setup Requirements
* PuppetLabs stdlib module
* Puppet version >= 2.7.x
* Facter version >= 1.6.2

###Beginning with module skeleton

To install the package provided by the module just include it:

        include skeleton

The main class arguments can be provided either via Hiera (from Puppet 3.x) or direct parameters:

        class { 'skeleton':
          parameter => value,
        }

##Usage

* A common way to use this module involves the management of the main configuration file via a custom template (provided in a custom site module):

        class { 'skeleton':
          config_file_template => 'site/skeleton/skeleton.conf.erb',
        }

* You can write custom templates that use setting provided but the config_file_options_hash paramenter

        class { 'skeleton':
          config_file_template      => 'site/skeleton/skeleton.conf.erb',
          config_file_options_hash  => {
            opt  => 'value',
            opt2 => 'value2',
          },
        }

* Use custom source (here an array) for main configuration file. Note that template and source arguments are alternative.

        class { 'skeleton':
          config_file_source => [ "puppet:///modules/site/skeleton/skeleton.conf-${hostname}" ,
                                  "puppet:///modules/site/skeleton/skeleton.conf" ],
        }


* Use custom source directory for the whole configuration directory, where present.

        class { 'skeleton':
          config_dir_source  => 'puppet:///modules/site/skeleton/conf/',
        }

* Use custom source directory for the whole configuration directory and purge all the local files that are not on the dir.
  Note: This option can be used to be sure that the content of a directory is exactly the same you expect, but it is desctructive and may remove files.

        class { 'skeleton':
          config_dir_source => 'puppet:///modules/site/skeleton/conf/',
          config_dir_purge  => true, # Default: false.
        }

* Use custom source directory for the whole configuration dir and define recursing policy.

        class { 'skeleton':
          config_dir_source    => 'puppet:///modules/site/skeleton/conf/',
          config_dir_recursion => false, # Default: true.
        }


##Operating Systems Support

This is tested on these OS:
- CentOS 6


##Development

Pull requests (PR) and bug reports via GitHub are welcomed.

When submitting PR please follow these quidelines:
- Provide puppet-lint compliant code
- If possible provide rspec tests
- Follow the module style and stdmod naming standards

When submitting bug report please include or link:
- The Puppet code that triggers the error
- The output of facter on the system where you try it
- All the relevant error logs
- Any other information useful to undestand the context
