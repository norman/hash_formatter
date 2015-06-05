# Hash Formatter

## Summary

This is a small, simple library for formatting Ruby Hashes, intended to be used by text editors. It uses [Ruby Parser](https://github.com/seattlerb/ruby_parser) and [Ruby2Ruby](https://github.com/seattlerb/ruby2ruby) rather than regular expressions, letting it parse even the trickiest Ruby code with ease.

At the moment, its formatting options are opinionated and simplistic. You can format Ruby hashes in the following formats:

Single-line, Ruby 1.9:

    {foo: bar, baz: bam}

Single-line, Ruby 1.8:

    {:foo => bar, :baz => bam}

Multiline, Ruby 1.8:

    {
      :foo       => bar,
      :baz       => bam,
      :hash_keys => 'are aligned'
    }

These choices allow me to edit code using my completely subjective, arbitrary personal preferences:

* Use hashrockets and align assignments for multiline Hashes.
* Use 1.9 style Hashes for single-line hashes, except when the values are symbols, because `{foo: :bar}` looks stupid to me.

## API

```ruby
require 'hash_formatter'
hash = {:foo => 'bar'}
formatter = HashFormatter.new(hash.inspect)
formatter.to_18 #=> '{:foo => "bar"}'
formatter.to_19 #=> '{foo: "bar"}'
formatter.to_multiline #=> "{\n  :foo => "bar"\n}"
```

## Docs

None, yet, but the source is less than 100 lines so you might want to start there.

## Vim Integration

Coming Real Soon&trade;.

## Author

[Norman Clarke](mailto:norman@njclarke.com)

## License

Copyright (c) 2015 Norman Clarke

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
