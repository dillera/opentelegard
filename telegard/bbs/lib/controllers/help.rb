=begin
               ================================================
                      OpenTelegard/2 Operating SubSystem
               Copyright (C) 2008-2011   LeafScale Systems, LLC
                           http://www.telegard.org
               ================================================


---[ License & Distribution ]------------------------------------------------

Copyright (c) 2008-2011, LeafScale Systems, LLC
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

 Source File: /lib/controllers/help.rb
     Version: 1.00
   Author(s): Chris Tusa <chris.tusa@telegard.org>
 Description: Help Menu controller.

-----------------------------------------------------------------------------
=end

=begin rdoc
= HelpController
The Help Menu controller.
=end

# Help Controller Class
class HelpController < Tgcontroller

  def menu
    done = false
    validkeys=['A','B','C','F','H','M','P','T','U','S', 'X']
    until done == true
      key = Tgio::Input.menuprompt('menu_help.ftl',validkeys, nil) # nil is for tpl vars hash
      test_session
      print "\n"
      case key
        when "A" # About Telegard         
          Tgtemplate.display('help_about.ftl', nil)
        when "B" # BBS Lists Help
          Tgtemplate.display('help_bbslists.ftl', nil)          
        when "C" # Chat Rooms Help
          Tgtemplate.display('help_chat.ftl', nil)
        when "F" # File Areas Help
          Tgtemplate.display('help_fileareas.ftl', nil)
        when "H" # Call History Help
          Tgtemplate.display('help_callhistory.ftl', nil)
        when "M" # Messages Areas Help
          Tgtemplate.display('help_msgareas.ftl', nil)
        when "P" # Page Sysop Help
          Tgtemplate.display('help_pagesysop.ftl', nil)
        when "T" # Timebank Help
          Tgtemplate.display('help_timebank.ftl', nil)
        when "U" # User Menu Help
          Tgtemplate.display('help_useraccount.ftl', nil)
        when "S" # Command Summary
          Tgtemplate.display('help_commands.ftl', nil)
        when "X" # Return to Main
          done = true          
      end #/case
      test_session
    end #/until
    return 0
  end #/def menu
 
end