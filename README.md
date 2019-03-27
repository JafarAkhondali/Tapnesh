# Tapnesh
Tapnesh will optimize your images in parallel easily and efficiently!
Tapnesh is only a wrapper to optimize images using `jpegoptim` for jpe?g and `pngquant` for png files in parallel using `parallel` package.

Installation
===
Just run this in your terminal    
`curl -Ss https://raw.githubusercontent.com/JafarAkhondali/Tapnesh/master/install.sh | bash`


Dependencies
---
```
pngquant
parallel
jpegoptim
```

Demo
---

Before Optimization ( Size: 4.1m )
![Before](https://user-images.githubusercontent.com/11364402/49339239-3e67d000-f644-11e8-91b8-5985b66880d0.jpg)


After Optimization ( `-q 45` Size: 1014kb )
![After](https://user-images.githubusercontent.com/11364402/49339240-3e67d000-f644-11e8-9793-d609f6f1fb42.jpg)


Examples
---
Optimize single image   
`tapnesh -p img.png`

Optimize single image with 75% of quality   
`tapnesh -p img.png -q 75`

Optimize whole directory with 85% of quality    
`tapnesh -p mydir -R -q 85`


Optimize whole directory and keep old files with 85% of quality    
`tapnesh -p mydir -R -q 85 -k `

Optimize image and keep old file     
`tapnesh -p img.jpg -k `


Options
---

```
Tapnesh is wrapper for image optimizers, It simply lets you optimize images in directory(ies) or single images in parallel
Usage: /usr/local/bin/tapnesh [-q|--quality <arg>] [-p|--path <arg>] [-R|--(no-)recursive] [-v|--(no-)verbose] [-k|--(no-)keep] [-h
|--help]
        -q,--quality: Sets quailty for optimized images, can be a value from 1 to 100. (100 means loseless optimization) (default:

'85')
        -p,--path: Path to directory for optimization (default: '.')
        -R,--recursive,--no-recursive: Do recursive (off by default)
        -v,--verbose,--no-verbose: Be verbose (off by default)
        -k,--keep,--no-keep: Keep old files (off by default)
        -h,--help: Prints help
```
