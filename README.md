# flutter_gravatar

An easy to use Flutter/Dart package for generating Gravatar image and profile urls. 

For more information about Gravatar please visit https://gravatar.com  

## Example  
```
final gravatar = Gravatar("yg@beerstorm.net");  

// get Gravatar imageUrl
gravatar.imageUrl();

// get Gravatar profileUrl
gravatar.profileUrl();// default .json
gravatar.profileUrl(".xml");// supported formats: .json, .xml, .vcf, .qr

// get Gravatar HASH for this user's email  
gravatar.hash();
```  
  
## API  
`imageUrl({int size, String defaultImage, bool forceDefault: false, String rating})`  
Generates an image url

- size (Imagesize) default: 80 
- defaultImage (Url or Kind for the Fallback Image) default: identicon  
- forceDefault (force the Fallback Image) default: false
- rating (restrict to appropriate Images) default: g

For further information about the parameters please visit https://en.gravatar.com/site/implement/images/

## Install  
```
dependencies:  
    flutter_gravatar: any
```  

## Support  
You can file issues at https://github.com/beerstorm-net/flutter_gravatar/issues  
Pull requests are welcome.  