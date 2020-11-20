# Real night mode

Real night mode

## Getting Started
```
dependencies:
  night_mode: ^0.01
```
## Example
```
LightDelegate delegate = DefaultLightDelegate(radius: radius);
...
NightMode(
    delegate: delegate,
    alwaysOn: alwaysOn,
    child: Stack(
      children: [
        Image.asset(
          './assets/rem.jpg',
          fit: BoxFit.fitHeight,
          height: double.infinity,
        ),
      ],
    ),
    ),
```
![0.gif](https://github.com/wuweijian1997/night_mode/blob/main/example/gifs/0.gif)
![1.gif](https://github.com/wuweijian1997/night_mode/blob/main/example/gifs/1.gif)
![2.gif](https://github.com/wuweijian1997/night_mode/blob/main/example/gifs/2.gif)
![3.gif](https://github.com/wuweijian1997/night_mode/blob/main/example/gifs/3gif)
![4.gif](https://github.com/wuweijian1997/night_mode/blob/main/example/gifs/4.gif)
![5.gif](https://github.com/wuweijian1997/night_mode/blob/main/example/gifs/5.gif)
