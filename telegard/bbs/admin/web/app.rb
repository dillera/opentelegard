=begin
               ================================================
                      OpenTelegard/2 Operating SubSystem
               Copyright (C) 2008-2011   LeafScale Systems, LLC
                           http://www.telegard.org
               ================================================


---[ License & Distribution ]------------------------------------------------

Copyright (c) 2008-2011, Chris Tusa & LeafScale Systems, LLC
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of LeafScale Systems nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.


---[ File Info ]-------------------------------------------------------------

 Source File: /admin/web/app.rb
     Version: 1.00
   Author(s): Chris Tusa <chris.tusa@telegard.org>
 Description: Ramaze App loader 

-----------------------------------------------------------------------------

=end

# This file contains your application, it requires dependencies and necessary
# parts of the application.
#
# It will be required from either `config.ru` or `start.rb`

require 'rubygems'
require 'java'
require 'ramaze'
require 'yaml'
puts "Starting Telegard/2 Admin Web Server..."
# Load Telegard Config File
puts "Loading Config"
$tgcfg = File.open('conf/telegard.conf.yaml')  { |yf| YAML::load( yf ) }

puts "Loading Telegard Libraries..."
# Load Telegard Library Dependencies
require 'lib/tgconstants'
require 'lib/rubyclass_extensions'
require 'lib/security'
require 'lib/tgio'

puts "Passing control to Ramaze..."
# Make sure that Ramaze knows where you are
Ramaze.options.roots = [__DIR__]


# Initialize controllers and models
require __DIR__('model/init')
require __DIR__('controller/init')

