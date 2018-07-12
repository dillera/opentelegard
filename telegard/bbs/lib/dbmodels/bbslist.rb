=begin
               ================================================
                      OpenTelegard/2 Operating SubSystem
                  Copyright (C) 2010, LeafScale Systems, LLC
                           http://www.telegard.org
               ================================================


---[ License & Distribution ]------------------------------------------------

Copyright (c) 2010, Chris Tusa & LeafScale Systems, LLC
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

 Source File: /lib/dbmodels/bbslist.rb
     Version: 1.00
   Author(s): Chris Tusa <chris.tusa@telegard.org>
 Description: BBS List Schema for Database

-----------------------------------------------------------------------------


=begin rdoc
= Tgdatabase_models (Database Models)
Tgdatabase_models defines the Sequel Model classes for the data structures.

== BBSlist Structure

=end


# Chat Room Structure
class Tgbbslist < Sequel::Model(:bbslist)
  Tgio.printstart " DB Model: bbslist"
  set_schema do
    primary_key  :id
    varchar      :bbsname
    Text         :description
    varchar      :sysopname
    varchar      :bbsurl
    varchar      :homepage
    varchar      :submitted_by
    TimeStamp    :created

  end

  create_table unless table_exists?

  if empty?
    create  :bbsname => 'OpenTelegard Official BBS',
            :description => 'The official OpenTelegard BBS. This server runs official releases and is a full-production system.',
            :sysopname => 'TELEGARDIAN',
            :bbsurl => 'ssh://telegard:opentg@bbs.telegard.org',
            :homepage => 'http://www.telegard.org/bbslist',
            :submitted_by => '(OPENTG)',
            :created => Time.now

    create  :bbsname => 'OpenTelegard AlphaSite',
            :description => 'AlphaSite is a project sponsored server running current code from the source tree. Users can expect missing features, occasional crashes, and frequent database refreshes. This server should not be used in production.',
            :sysopname => 'TELEGARDIAN',
            :bbsurl => 'ssh://telegard:opentg@alpha.telegard.org',
            :homepage => 'http://www.telegard.org/bbslist',
            :submitted_by => '(OPENTG)',
            :created => Time.now



  end
  Tgio.printreturn(0)
end
