require 'bundler'
Bundler.require

describe QueryParams do
  it "generates nothing if need be" do
    QueryParams.encode({}).should eq ""
    QueryParams.encode(nil).should eq ""
  end

  it "generates a straight forward query string" do
    QueryParams.encode({a: 1, b: "c"}).should eq "a=1&b=c"
  end

  it "handles nested hashes" do
    QueryParams.encode({a: {b: 'c', d: 'e'}, f: 'g'}).should eq "a[b]=c&a[d]=e&f=g"
  end

  it "handles arrays" do
    QueryParams.encode_with_index({a: ['bingo', 'hepp']}).should eq "a[0]=bingo&a[1]=hepp"
  end

  it "handles arrays of hashes" do
    QueryParams.encode({a: [{b:'c', d:'e'}, {b:'g'}]}).should eq "a[0][b]=c&a[0][d]=e&a[1][b]=g"
  end

end