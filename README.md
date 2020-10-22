# flutter_gravatar

An easy to use Flutter/Dart package for generating Gravatar image and profile urls. 

For more information about Gravatar please visit https://gravatar.com  

## Example  
```
final gravatar = Gravatar("yg@beerstorm.net");  

// get Gravatar HASH for this user
gravatar.gravatarHash();

// get Gravatar imageUrl
gravatar.gravatarImageUrl();

// get Gravatar profileUrl
gravatar.gravatarProfileUrl();// default .json
gravatar.gravatarProfileUrl(".xml");// supported formats: .json, .xml, .vcf, .qr
   
```