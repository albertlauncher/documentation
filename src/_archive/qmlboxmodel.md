---
layout: docs
title: QML Box Model
permalink: /docs/extensions/qmlboxmodel/
---

QML is a user interface markup language. It is a JSON-like declarative language for designing user interface–centric applications. Inline JavaScript code handles imperative aspects. This allows extremely flexible, flashy and animated interfaces, without coding imperative lines for hours and hours.

QML allows to write the entire user interface in QML and Javascript. There is actually no need for another QML UI plugin anymore since the C++ code below to run QML would not change. Hence the QML plugin itself is modular, designed to have several styles adhering to a determined QML-C++ interface. You can even write one on your own!

A style in this context means a QML Frontend written in QML. v0.13 comes with a standard style: The Box Model style. The Box Model style has properties that can be set with predefined themes. You could even make your own theme with the easy to use property editor without touching a single line of code! Check out this how-to [video](https://www.youtube.com/watch?v=aCyB3ZngbLk&feature=youtu.be).
