require 'digest/sha1'

feature "Deprecated Classes" do

  step "a list of deprecated files" do | files |
    @files = files.to_h
    @files.delete('file')
  end

  step "a deprecation message:" do | msg |
    @msg = msg
  end

  step "any of the files is detected as being modified" do
    @expected = @files.keys.each_with_object({}) do | filename, current_shas |
       contents = File.read(File.expand_path(File.join(__dir__,'..','..',filename)))
       current_shas[filename] = Digest::SHA1.hexdigest(contents)
     end
  end

  step "this test will fail with a deprecation message" do
    expect( @expected ).to match( @files ), @msg
  end

end
