!SLIDE
# Getting Hands On With Adhearsion #
## http://adhearsion.com ##
<div class="author" style="float: left;">
  <ul>
    <li>Ben Klang</li>
    <li>Founder, Mojo Lingo</li>
    <li>bklang@mojolingo.com</li>
    <li>Twitter/Github: @bklang</li>
  </ul>
</div>
<div class="author" style="float: right;">
  <ul>
    <li>Ben Langfeld</li>
    <li>Super Awesome Description</li>
    <li>ben@langfeld.me</li>
    <li>Twitter/Github: @benlangfeld</li>
  </ul>
</div>

!SLIDE bullets incremental
# What is Adhearsion? #

* Ruby-based framework for telephony applications
* Inspired by Rails, but not dependent
* Abstracts away the complexity<br>of the telephony world

!SLIDE center
![feature_map.png](feature_map.png)

!SLIDE center
# Embedding Adhearsion in Rails #
![ahn_dir_structure.png](ahn_dir_structure.png)
![rails_dir_structure.png](rails_dir_structure.png)

!SLIDE bullets incremental
# Simple example application #

* Everyone loves a spontaneous conference call
* Getting people in is tricky
* Not everyone likes the phone ringing
* Not everyone is available

!SLIDE bullets incremental
# A solution, live #

* Simple rails app for managing contacts
* Select contacts to call
* System calls you and throws you into a conference
* Also ask contacts via Jabber if they are available
* Will read apologies via Jabber into the conference
