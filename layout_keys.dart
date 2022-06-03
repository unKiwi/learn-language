// part of virtual_keyboard_multi_language;
// //import '../virtual_keyboard_multi_language.dart';

// abstract class VirtualKeyboardLayoutKeys {
//   int activeIndex = 0;

//   List<List> get defaultEnglishLayout => _defaultEnglishLayout;
//   List<List> get defaultArabicLayout => _defaultArabicLayout;

//   List<List> get activeLayout => getLanguage(activeIndex);
//   int getLanguagesCount();
//   List<List> getLanguage(int index);

//   void switchLanguage() {
//     if ((activeIndex + 1) == getLanguagesCount())
//       activeIndex = 0;
//     else
//       activeIndex++;
//   }
// }

// class VirtualKeyboardDefaultLayoutKeys extends VirtualKeyboardLayoutKeys {
//   List<VirtualKeyboardDefaultLayouts> defaultLayouts;
//   VirtualKeyboardDefaultLayoutKeys(this.defaultLayouts);

//   int getLanguagesCount() => defaultLayouts.length;

//   List<List> getLanguage(int index) {
//     switch (defaultLayouts[index]) {
//       case VirtualKeyboardDefaultLayouts.English:
//         return _defaultEnglishLayout;
//       case VirtualKeyboardDefaultLayouts.Arabic:
//         return _defaultArabicLayout;
//       default:
//     }
//     return _defaultEnglishLayout;
//   }
// }

// /// Keys for Virtual Keyboard's rows.
// const List<List> _defaultEnglishLayout = [
//   // Row 1
//   const [
//     'q',
//     'w',
//     'e',
//     'r',
//     't',
//     'y',
//     'u',
//     'i',
//     'o',
//     'p',
//     VirtualKeyboardKeyAction.Backspace
//   ],
//   // Row 2
//   const [
//     'a',
//     's',
//     'd',
//     'f',
//     'g',
//     'h',
//     'j',
//     'k',
//     'l',
//     ';',
//     '\'',
//     VirtualKeyboardKeyAction.Return
//   ],
//   // Row 3
//   const [
//     VirtualKeyboardKeyAction.Shift,
//     'z',
//     'x',
//     'c',
//     'v',
//     'b',
//     'n',
//     'm',
//     ',',
//     '.',
//     '/',
//     VirtualKeyboardKeyAction.Shift
//   ],
//   // Row 4
//   const [
//     VirtualKeyboardKeyAction.SwithLanguage,
//     VirtualKeyboardKeyAction.Space,
//     '.',
//   ]
// ];

// // luc torres edit
// const List<List> _defaultArabicLayout = [
//   // Row 1
//   const [
//     'й',
//     'ц',
//     'у',
//     'к',
//     'е',
//     'н',
//     'г',
//     'ш',
//     'щ',
//     'з',
//     'х',
//     'ъ',
//     'ё',
//     VirtualKeyboardKeyAction.Backspace
//   ],
//   // Row 2
//   const [
//     'ф',
//     'ы',
//     'в',
//     'а',
//     'п',
//     'р',
//     'о',
//     'л',
//     'д',
//     'ж',
//     'э',
//   ],
//   // Row 3
//   const [
//     VirtualKeyboardKeyAction.Shift,
//     'я',
//     'ч',
//     'с',
//     'м',
//     'и',
//     'т',
//     'ь',
//     'б',
//     'ю',
//     VirtualKeyboardKeyAction.Shift
//   ],
//   // Row 4
//   const [
//     VirtualKeyboardKeyAction.SwithLanguage,
//     VirtualKeyboardKeyAction.Space,
//     '.',
//   ]
// ];
