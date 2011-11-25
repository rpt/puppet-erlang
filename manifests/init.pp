package {
  "curl":
    ensure => present;
}

exec {
  "kerl":
    path    => ["/bin", "/usr/bin"],
    cwd     => "/usr/local/bin",
    command => "curl -O https://raw.github.com/spawngrid/kerl/master/kerl",
    creates => "/usr/local/bin/kerl",
    require => Package["curl"];
}

file {
  "kerl":
    path    => "/usr/local/bin/kerl",
    mode    => 755,
    require => Exec["kerl"];
}

Erlang {
  ensure  => present,
  require => File["kerl"]
}
