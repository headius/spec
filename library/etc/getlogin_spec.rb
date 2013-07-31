require File.expand_path('../../../spec_helper', __FILE__)
require 'etc'

describe "Etc.getlogin" do
  it "returns the name of the user who runs this process" do
    if ENV["SUDO_USER"]
      # through sudo, getlogin equals SUDO_USER
      Etc.getlogin.should == ENV["SUDO_USER"]
    elsif Etc.getlogin
      Etc.getlogin.should == username
    else
      # Etc.getlogin may return nil if the login name is not set
      # because of chroot or sudo or something.
      Etc.getlogin.should be_nil
    end
  end
end
