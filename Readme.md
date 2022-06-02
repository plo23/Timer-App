Timer study app

This application allows users to create their own study timers and utilize them. On the timer creation screen, you can create a timer with a study time and a break time. The timer will be added to the list of current timers. (Currently, there is no way to remove them in the app interface - potential expansion idea.) On starting each timer, the study time will count down and automatically shift to the break time, which will automatically go back to the home screen at the end of the time. This allows the user to then choose what time they would like to do next (repeat or pick a new one) The app utilizes two dart packages I have not worked with before: async and circular countdown timer.

Sources used:

The popups were inspired from a tutorial by Johannes Milke Source code for popups: https://github.com/JohannesMilke/dialog_with_textfield Tutorial: https://www.youtube.com/watch?v=D6icsXS8NeA

Site I used to learn how to retrieve data from textfields & controller: https://docs.flutter.dev/cookbook/forms/retrieve-input

Design of original timer screen was from doctor code: https://www.youtube.com/watch?v=4Zbf-PS9Q84

Current timer plugin: https://pub.dev/packages/circular_countdown_timer

Site used to learn how to restrict input to numbers: https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter

Site used for help with dynamically adding to lists: https://googleflutter.com/flutter-add-item-to-listview-dynamically/
