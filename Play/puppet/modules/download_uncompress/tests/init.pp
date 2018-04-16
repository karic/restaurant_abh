download_uncompress { 'dwnl_inst_libreoffice':
  download_base_url => 'http://jee.invallee.it/dist',
  dest_folder       => '/tmp',
  creates           => '/tmp/installFolder',
  uncompress        => 'tar.gz',
}
