class google_cloud_sdk::repositories {
  yumrepo { 'google-cloud-sdk':
    descr    => "Google Cloud SDK",
    baseurl  => 'https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg',
    before   => [Package['google-cloud-sdk']],
  }
}
