Puppet::Type.type(:erlang).provide(:kerl) do
  desc "Installs erlang releases using kerl script."

  optional_commands :kerl => 'kerl'
  defaultfor :kerl => :exists

  def create
    kerl "update", "releases"
    kerl "build", resource[:release].upcase, resource[:release].downcase
    kerl "install", resource[:release].downcase, resource[:target] + "/" + resource[:release].downcase

    if resource[:clean]
      kerl "delete", "build", resource[:release].downcase
    end
  end

  def destroy
    kerl "delete", "installation", resource[:target] + "/" + resource[:release].downcase
  end

  def exists?
    File.directory? resource[:target] + "/" + resource[:release].downcase
  end
end
