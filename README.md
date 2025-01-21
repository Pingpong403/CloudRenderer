# Overview

This project started out as a simple scene renderer. I planned on creating and animating several scenes such as a stormy forest or Newton's cradle. While working on the forest, however, I realized that I should keep it simple. I took one idea from that, lightning in the clouds, and created that instead.

The clouds are created from a number of randomly generated circles. They start out dark, but as you move the mouse around, you can light them up. This is achieved through the distance formula. Circles that are within a certain range from the mouse get brighter and brighter as it moves closer.

I have a background in math, so I wanted a way to incorporate some of it into my program. The formula that decides how bright a circle gets is based on a negatively-sloped line. The distance formula is based on the Pythagorean theorem.

Here is a video demonstrating my program:

[Software Demo Video](https://youtu.be/Rh6VwCO2VWk)

# Development Environment

I opted to use the Processing Development Environment, or PDE. It has a lot of built-in functionality that I needed for 2-D rendering. The most notable is the ellipse function, which builds a ellipse given position and size. I was also able to access the global mouseX and mouseY variables, which hold the current position of the mouse on every frame.

Other than those conveniences, the PDE allowed me to write Java. This language is quite mediocre, seeing as it doesn't have many strengths that other languages don't have. It is great for OOP, however, because classes are used extensively.

# Useful Websites

- [W3 Schools Java Tutorial](https://www.w3schools.com/java/default.asp)
- [Processing Reference](https://processing.org/reference)

# Future Work

- More modes
- Better color swapping, better buttons
- Inheritance

# 2 Years Later

I decided to revisit this project in early 2025 after having left it since I published it. Here's a list of all the changes I've made:

- The new Color class is now the basis for anything color-related (so, basically everything)
- The new Button class greatly improves the UI and UX
- The new Slider class enables easy custom colors
- Added option to switch between the bouncing Source or the user's mouse as the source of light
- Refactored to allow for any number of Color Buttons to be added.
- Slightly improved performance and greatly improved cohesion across the classes

I may revisit this again in the future, but, for now, I am happy with where these changes have left the project.
