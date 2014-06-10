// Copyright 2013 Hewlett-Packard
// Copyright 2013 OpenStack Foundation
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may
// not use this file except in compliance with the License. You may obtain
// a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.

function header(activeTabName) {
  tabsName = new Array();
  tabsLink = new Array();
  tabsName[0] = 'Status'; tabsLink[0] = 'http://static.trafodion.org/status/';
  tabsName[1] = 'Zuul'; tabsLink[1] = 'http://static.trafodion.org/status/zuul/';
  tabsName[2] = 'Rechecks'; tabsLink[2] = 'http://static.trafodion.org/rechecks/';
//  tabsName[3] = 'Release'; tabsLink[3] = 'http://static.trafodion.org/release/';
//  tabsName[4] = 'Reviews'; tabsLink[4] = 'http://static.trafodion.org/reviews/';
//  tabsName[5] = 'Bugday'; tabsLink[5] = 'http://static.trafodion.org/bugday/';

  document.write(
   '<div id="header" class="container">'+
   '<div class="span-5">'+
   ' <h1 id="logo"><a href="http://static.trafodion.org/">Trafodion</a></h1>'+
   '</div>\n'+
   '<div class="span-19 last blueLine">'+
   '<div id="navigation" class="span-19">'+
   '<ul id="Menu1">\n')

  for (var i = 0; i < tabsName.length; i++) {
      document.write('<li><a id="menu-'+tabsName[i]+'" href="'+tabsLink[i]+'"')
      if (tabsName[i] == activeTabName) {
          document.write(' class="current"');
      }
      document.write('>'+tabsName[i]+'</a></li>\n');
  }

  document.write(
   '</ul>'+
   '</div>'+
   '</div>'+
   '</div>')
}

function footer() {
 document.write(
  '<div class="container">'+
  '<hr>'+
  '<div id="footer">'+
  '<div class="span-4">'+
  '<h3>Trafodion</h3>'+
  '<ul>'+
  ' <li><a href="http://static.trafodion.org/projects/">Projects</a></li>'+
//  ' <li><a href="http:/static.trafodion.org/trafodion-security/">Trafodion Security</a></li>'+
  ' <li><a href="https://wiki.trafodion.org/wiki/index.php/Software">Understanding the Software</a></li>'+
//  ' <li><a href="http://static.trafodion.org/blog/">Blog</a></li>'+
  '</ul>'+
  '</div>\n'+
  '<div class="span-4">'+
  '<h3>Community</h3>'+
  '<ul>'+
  ' <li><a href="https://wiki.trafodion.org/wiki/index.php/Community">About the Community</a></li>'+
//  ' <li><a href="http://static.trafodion.org/community/">User Groups</a></li>'+
//  ' <li><a href="http://static.trafodion.org/events/">Events</a></li>'+
//  ' <li><a href="http://static.trafodion.org/jobs/">Jobs</a></li>'+
//  ' <li><a href="http://static.trafodion.org/companies/">Companies</a></li>'+
  ' <li><a href="https://wiki.trafodion.org/wiki/index.php/Contributing_to_the_Software">Contribute</a></li>'+
  '</ul>'+
  '</div>\n'+
  '<div class="span-4">'+
  '<h3>Documentation</h3>'+
  '<ul>'+
  ' <li><a href="https://wiki.trafodion.org/wiki/index.php/Documentation">Trafodion Documentation</a></li>'+
  ' <li><a href="https://wiki.trafodion.org/wiki/index.php/Using_the_Software">Using the Software</a></li>'+
  ' <li><a href="http://wiki.trafodion.org/">Wiki</a></li>'+
  '</ul>'+
  '</div>\n'+
  '<div class="span-4 last">'+
  '<h3>Branding &amp; Legal</h3>'+
  '<ul>'+
  ' <li><a href="https://wiki.trafodion.org/wiki/index.php/Legal_Information">Legal Information</a></li>'+
//  ' <li><a href="http://static.trafodion.org/brand/">Logos &amp; Guidelines</a></li>'+
//  ' <li><a href="http://static.trafodion.org/brand/trafodion-trademark-policy/">Trademark Policy</a></li>'+
  ' <li><a href="http://www8.hp.com/us/en/privacy/privacy.html">Privacy Policy</a></li>'+
  ' <li><a href="https://review.trafodion.org/static/cla.html">Trafodion CLA</a></li>'+
  '</ul>'+
  '</div>'+
  '</div>'+
  '</div>')
}

