class skeleton (

) inherits skeleton::params {

  class { 'skeleton::install': }
  class { 'skeleton::config': }
  class { 'skeleton::service': }

  # Containment
  anchor { 'skeleton::begin': } ->
  Class['skeleton::install'] ->
  Class['skeleton::config'] ->
  Class['skeleton::service'] ->
  anchor { 'skeleton::end': }
}
