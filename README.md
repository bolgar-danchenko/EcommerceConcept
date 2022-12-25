# EcommerceConcept

## Тестовое задание

Для выполнения этого тестового задания я изучил SwiftUI, так как до этого сталкивался с ним только поверхностно.
В качестве архитектурного решения выбрал MVVM как самый распространённый паттерн.

### Стэк:
* SwiftUI
* MVVM
* @EnvironmentObject property wrapper
* @ObservableObject property wrapper
* JSON Decodable / URL Session
* Custom Navigation Bar
* Custom shapes with Path
* Adaptive layout design

### Комментарии к проекту
1. На экране Explorer в разделе Hot Sales на втором элементе тексты наслаиваются друг на друга, так как на скачиваемой картинке уже есть тексты.
2. В блоке Best Sellers часто не загружается картинка для девайса Samsung Note 20 Ultra. Проблемы с самим изображением по ссылке - если перейти по ней, возникает 502 ошибка. Периодически ссылка работает - тогда и в приложении изображение скачивается.
3. Время от времени недоступны и другие изображения, но это происходит достаточно редко.
4. В детальной информации о продукте изображения отличаются от фигмы по формату: там вертикальные, а здесь скорее квадратные. В связи с этим только по одному элементу на экране за раз, иначе слишком мелко.
5. Если я правильно понял, в корзине нужно было отображать фиксированные данные из JSON, ссылка на который была в ТЗ. В связи с этим вся информация там статичная, которая содержалась в JSON.
6. Также статично сделаны другие объекты, функционал которых не описан в ТЗ - локация, фильтры, категории, поиск, добавление в избранное, страница профиля.

Надеюсь, что я правильно понял задание относительно статичных элементов. Если всё-таки нет и нужно было делать реальный функционал переключения категорий, фильтров, добавления в избранное и в корзину и т.д., то готов доработать.

### Видеодемонстрация

