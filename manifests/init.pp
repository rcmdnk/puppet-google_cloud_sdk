class google_cloud_sdk {
  class { 'google_cloud_sdk::repositories': }
  class { 'google_cloud_sdk::install': }
}
