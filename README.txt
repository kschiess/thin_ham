= thin_ham

Source: 
* http://github.com/kschiess/thin_ham

== DESCRIPTION:

thin_ham is a small tool to allow for fast prototyping of web sites. It will
publish files written in haml & sass [1] or alternatively just publish
whatever other files you happen to have lying around in the relevant
directories.

Since it is written as a web server, it will allow running javascript in your
prototype to use AJAX to load missing resources. This can be very useful when
developing modern websites. 

Note that thin_ham should under NO circumstances be used as a public web
server. It is not made that way. 


== SYNOPSIS:

Move to a directory of your choice (where your prototype will be located) and 
run: 

  thin_ham
  
thin_ham will then output an url under which the current directory can be 
accessed locally. 

== LICENSE:

(The MIT License)

Copyright (c) 2009 Kaspar Schiess

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
