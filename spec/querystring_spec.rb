require 'bundler'
Bundler.require

describe Querystring do 
  it "generates nothing if need be" do
    Querystring.encode({}).should eq ""
  end

  it "generates a straight forward query string" do
    Querystring.encode({a: 1, b: "c"}).should eq "a=1&b=c"
  end

  it "handles nested hashes" do
    Querystring.encode({a: {b: 'c', d: 'e'}, f: 'g'}).should eq "a[b]=c&a[d]=e&f=g"
  end

  it "handles arrays" do
    Querystring.encode({a: ['bingo', 'hepp']}).should eq "a[0]=bingo&a[1]=hepp"
  end

  it "handles arrays of hashes" do
    Querystring.encode({a: [{b:'c', d:'e'}, {f:'g'}]}).should eq "a[0][b]=c&a[0][d]=e&a[1][f]=g"
  end
end