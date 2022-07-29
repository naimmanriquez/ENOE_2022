## Encuesta Nacional de Ocupación y Empleo
La Encuesta Nacional de Ocupación y Empleo (ENOE) es la principal fuente de información sobre el mercado laboral mexicano al ofrecer datos mensuales y trimestrales de la fuerza de trabajo, la ocupación, la informalidad laboral, la subocupación y la desocupación. Constituye también el proyecto estadístico continuo más grande del país al proporcionar cifras nacionales y de cuatro tamaños de localidad, de cada una de las 32 entidades federativas y para un total de 39 ciudades.
## Modelo Logit para medir la intención de rotación laboral
La regresión Logit se utiliza cuando queremos predecir un resultado binario, por ejemplo, si una persona presenta o no una caracteristica, como por ejemplo: deudor vs. no deudor y sabemos que existen varios factores que pueden incidir sobre tal resultado. Esta regresión binaria es un tipo de análisis de regresión donde la variable
dependiente es una variable dummy: código 0 (Buen Cliente) o 1 (Mal Cliente).
La regresión logística se basa en la denominada función logística, donde se relaciona la variable dependiente con las variables independientes: ![equation](https://latex.codecogs.com/svg.image?\large&space;\_{x1},&space;_{x2},&space;_{x3}&space;...&space;_{xn}); a través de la siguiente ecuación:

![equation](https://latex.codecogs.com/svg.image?\large&space;_{Yi}&space;=&space;\frac{1}{1&plus;exp(-z)}&plus;_{ui})

Donde, 

![equation](https://latex.codecogs.com/svg.image?_{Yi}:)Variable dependiente. Puede tomar valores de cero o uno

![equation](https://latex.codecogs.com/svg.image?_{Z}:) Scoring Logístico

En el cual ![equation](https://latex.codecogs.com/svg.image?z&space;=&space;_{\beta_0}&plus;_{\beta_1&space;X_1}&plus;&plus;_{\beta_2&space;X_2}&plus;...&plus;_{\beta_k&space;X_k})

![equation](https://latex.codecogs.com/svg.image?_{u_i}): Es una variable aleatoria que se distribuye normalmente 

Si denotamos por Y a la variable a predecir, y por ![equation](https://latex.codecogs.com/svg.image?\large&space;\_{x1},&space;_{x2},&space;_{x3}&space;...&space;_{xn}) a las k variables predictoras, la regresión logística se expresa de la manera siguiente:
