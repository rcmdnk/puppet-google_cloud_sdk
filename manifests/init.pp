class google_cloud_sdk (
  $service_account_file = "",
  $service_account_content = "",
  $user = "root",
  $tmp_file = "/tmp/service_account_file",
  $project = "",
  $zone = "",
){
  class { 'google_cloud_sdk::repositories': }
  class { 'google_cloud_sdk::install': }
  if $service_account_file != "" {
    class { 'google_cloud_sdk::service_account':
      service_account_file => $service_account_file,
      service_account_content => $service_account_content,
      tmp_file => $tmp_file,
      user => $user,
      project => $project,
      zone => $zone,
    }
  }
}
