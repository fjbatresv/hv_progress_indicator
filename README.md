# hv_progress_indicator

Progress indicator for usage on vertical or horizontal. You can set a dot like mark

## Usage

For handle this plugin you have many params:
- dot [boolean]
- doColor [Color]
- animate [boolean]
- height [double]
- width [double]
- percentage [double]
- animationTime [int, ms]
- color [Color]
- backgroundColor [Color]

## Example
~~~~
HVProgressIndicator(
    color: getColor(context, ColorNames.PURPLE4),
    dotColor: getColor(context, ColorNames.WHITE),
    backgroundColor: getColor(context, ColorNames.BLACK1),
    dot: true,
    height: 200,
    animate: true,
    animationTime: 1500,
    width: 24,
    percentage: 20,
);
~~~~

![Gif](https://github.com/fjbatresv/hv_progress_indicator/blob/master/resources/animated.gif?raw=true)