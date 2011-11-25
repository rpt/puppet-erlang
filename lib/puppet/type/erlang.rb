Puppet::Type.newtype(:erlang) do
  @doc = "Install erlang."

  ensurable

  newparam(:release) do
    desc "Erlang release to be installed."

    validate do |value|
      unless value =~ /^r1[0-9][ab](-\d|\d{2}|)$/i
        raise ArgumentError, "%s is not a valid erlang release" % value
      end
    end

    isnamevar
  end
  
  newparam(:target) do
    desc "Destination where erlang should be installed."

    validate do |value|
      unless value =~ /^(\/[a-z0-9])+/i
        raise ArgumentError, "%s is not a valid target path" % value
      end
    end

    defaultto "/usr/local/erlang"
  end

  newparam(:clean) do
    newvalues(:true, :false)

    defaultto false
  end
end
