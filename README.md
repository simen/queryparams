# QueryParams

A straight forward gem to convert ruby hashes and arrays to http query strings. It supports hashes, arrays, nested hashes and arrays of hashes and all combinations thereof. E.g.:

    QueryParams.encode({a: 1, b: "c"})
    => "a=1&b=c"

    QueryParams.encode({a: {b: 'c', d: 'e'}, f: 'g'})
    => "a[b]=c&a[d]=e&f=g"

    QueryParams.encode({a: ['bingo', 'hepp']})
    => "a[0]=bingo&a[1]=hepp"

    QueryParams.encode({a: [{b:'c', d:'e'}, {f:'g'}]})
    => "a[][b]=c&a[][d]=e&a[][f]=g"
