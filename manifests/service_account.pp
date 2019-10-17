class google_cloud_sdk::service_account (
  $service_account_file = "",
  $service_account_content = "",
  $tmp_file = "/tmp/service_account_file",
  $user = "root",
  $project = "",
  $zone = "",
){
  if $service_account_file != "" or $service_account_content != "" {
    if $service_account_file != "" {
      settings = {path => $tmp_file, source => $service_account_file, owner => $user, mode => "600"}
    }else{
      settings = {path => $tmp_file, content => $service_account_content, owner => $user, mode => "600"}
    }
    file {"service_account_file":
      * => $settings
    }
    exec {"GCP account setting":
      command => "/usr/bin/sudo -u ${user} /usr/bin/gcloud auth activate-service-account --key-file ${tmp_file}",
    }
    if $project != "" {
      exec {"GCP project setting":
        command => "/usr/bin/sudo -u ${user} /usr/bin/gcloud config set project ${project}",
      }
    }
    if $zone != "" {
      exec {"GCP zone setting":
        command => "/usr/bin/sudo -u ${user} /usr/bin/gcloud config set compute/zone ${zone}",
      }
    }
    exec {"GCP account file deletion":
      command => "/usr/bin/sudo -u ${user} rm -f ${tmp_file}",
    }
  }
}
