# b9apache

Installs and configures Apache2 and a default site that accepts a wildcard subdomain through the xip.io service. 

### Example:

http://test.33.33.33.20:8887 would resolve to `/var/www/test/public_html`

If using mod_rewrite make sure to set the Rewrite Base to /:

`
//.htaccess  
RewriteBase /
`