# Repository OpenWrt by ilblogdicristiangallo
<div align="center">
  <img src="https://github.com/ilblogdicristiangallo/ilblogdicristiangallo_repo_openwrt/blob/main/repository-openwrt-by-ilblogdicristiangallo.png?raw=true" 
       alt="Repository OpenWrt by ilblogdicristiangallo"
       width="600"
       style="height: auto;">
</div>


# Access your router via PuTTY

Connect to your OpenWrt router using PuTTY, usually at:
<pre>192.168.1.1</pre>

Login:
<pre>root</pre>
Enter your password if you have one; otherwise continue.

# Add the ilblogdicristiangallo repository

Run this command to add the feed only if it is not already present:
<pre>grep -q cristian_repo /etc/opkg/customfeeds.conf || \
echo 'src/gz cristian_repo https://ilblogdicristiangallo.github.io/ilblogdicristiangallo_repo_openwrt' >> /etc/opkg/customfeeds.conf</pre>

# Import the repository GPG key

Download the public key:
<pre>wget -O /tmp/ilblogdicristiangallo.pub https://github.com/ilblogdicristiangallo/ilblogdicristiangallo_repo_openwrt/raw/refs/heads/main/ilblogdicristiangallo.pub</pre>

# Install the key:
<pre>opkg-key add ilblogdicristiangallo.pub</pre>

