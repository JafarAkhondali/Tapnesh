<h1 align=center > 
    :sparkles: Tapnesh :sparkles:
</h1>

[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)   Tapnesh is a CLI bash script which will optimize all your images in parallel easily and efficiently!   
You can use it on a single image or specify a whole directory.

Demo
---
Image Size: 1920x1080  
:star: Before => Original size: `863kb`
![before](https://user-images.githubusercontent.com/11364402/88002052-d581e400-cb16-11ea-94b2-8d369b60d5fc.jpg)

:star: After  => Optimized Size: `304kb` (64.85% size decreased using `-q 70` in 0.06 seconds)
![after](https://user-images.githubusercontent.com/11364402/88002736-77560080-cb18-11ea-89d6-69740a6e3ec6.jpg)


Examples
---
Optimize single image   
`tapnesh img.png`

Optimize single image with 75% of quality   
`tapnesh img.jpg -q 75`

Optimize images in `mydir` directory    
`tapnesh mydir`

Optimize images in `mydir` directory recursive
`tapnesh mydir -R`

Optimize single image and keep old file     
`tapnesh img.jpg -k `

Optimize whole directory and keep old files with 85% of quality    
`tapnesh mydir -R -q 85 -k `


Usage
---
```
Usage: tapnesh [-q|--quality <arg>] [-R|--(no-)recursive] [-v|--(no-)verbose] [-k|--(no-)keep] [-h|--help] <path>
        <path>: Path to directory for optimization
        -q, --quality: Sets quality for optimized images, can be a value from 1 to 100. (100 means lossless optimization) (default: '80')
        -R, --recursive, --no-recursive: Do recursive (off by default)
        -v, --verbose, --no-verbose: Be verbose (off by default)
        -k, --keep, --no-keep: Keep old files (off by default)
        -h, --help: Prints help

```

Pre-Install
===
**You'll first need to install the dependencies**

Ubuntu and other Debian based distros:   
`sudo apt install pngquant parallel jpegoptim`

Arch:   
`sudo pacman -S pngquant parallel jpegoptim`

Other distros:
Just install `pngquant parallel jpegoptim` using your package manager.  

Currently, only gnu\linux based distros are supported. 
 
Installation
===      

If you trust me, just run this in your terminal       
`curl -Ss https://raw.githubusercontent.com/JafarAkhondali/Tapnesh/master/install.sh | bash`  
else: just copy the `tapnesh.sh` to some executable path  


Community
===
:robot: [TapneshBot](https://github.com/AlirezaKm/TapneshBot):   
A dockerized telegram bot which can optimize your images using telegram messenger.
[@tapneshbot](http://t.me/tapneshbot)

Dependencies
---
```
pngquant
parallel
jpegoptim
```

How does it work?
---
Tapnesh is only a wrapper to optimize images using `jpegoptim` for jpe?g and `pngquant` for png files.
If optimizing multiple images (for example, working on a directory), Tapnesh uses `parallel` package under the hood to work optimize images per one cpu core. 


## Contributing
**Are you a user?**  
Please suggest your requirements, ideas and bugs in issues.

**Are you a developer?**

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## License

GNU General Public License v3
