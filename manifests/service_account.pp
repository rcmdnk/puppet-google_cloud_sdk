class google_cloud_sdk::service_account (
  $service_account_file = "",
  $tmp_file = "/tmp/service_account_file",
  $user = "root",
  $project = "",
  $zone = "",
){
  if $service_account_file != "" {
    file {"service_account_file":
      path => $tmp_file,
      source => $service_account_file,
      owner => $user,
      mode => "600",
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
