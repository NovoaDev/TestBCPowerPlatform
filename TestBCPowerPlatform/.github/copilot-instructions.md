# Instrucciones para Copilot
## Generación de código    
-   Todo el código debe escribirse en **inglés**.
-   Declara explícitamente los **modificadores de acceso** a los procedures (`local`, `internal`, `public`), priorizando `local` o `internal` según corresponda.
-   Al utilizar `Insert`, `Modify`, `Delete` o `DeleteAll`, pasa siempre `true` como parámetro para asegurar la ejecución completa de la lógica de negocio. Ejemplo: `Insert(true)`, `Modify(true)`.
-   Al utilizar `FindSet()`, especifica el parámetro de acuerdo con la intención del bloque. Si la tabla será modificada, usa `FindSet(true)`; de lo contrario, usa `FindSet(false)`.
-   Al asignar el valor a un campo, **no lo hagas por asignación directa**; utiliza `Validate` para asegurar la correcta ejecución de lógica relacionada.
-   No insertes texto **hardcodeado** en mensajes ni en elementos de interacción con el usuario. Usa `Labels` para facilitar la generación del archivo de traducción.
-   No declares múltiples variables del mismo tipo en una sola línea. Ejemplo incorrecto: `MyInt1, MyInt2, MyInt3: Integer;`.
-   Controla todos los elementos de interfaz gráfica (`Message`, `Confirm`, etc.) utilizando `GuiAllowed()` para evitar errores en procesos en segundo plano.
-   Usa el sufijo correcto en las variables tipo `Label`, según su propósito:
    -   `Msg` – Mensajes.
    -   `Tok` – Constantes como tokens, URLs, etc.
    -   `Err` – Errores.
    -   `Qst` – Para `StrMenu` o `Confirm`.
    -   `Lbl` – Textos que requieren traducción (`Label`, `Caption`).
-   Aplica los principios **SOLID** en el diseño del código:
    -   **SRP** – Principio de Responsabilidad Única: Cada módulo debe tener una única razón para cambiar.
    -   **OCP** – Principio Abierto/Cerrado: El código debe estar abierto a extensiones (eventos, interfaces) pero cerrado a modificaciones directas.
    -   **LSP** – Principio de Sustitución de Liskov: Usa interfaces para garantizar que las implementaciones puedan ser intercambiables sin alterar el comportamiento esperado.
    -   **ISP** – Principio de Segregación de Interfaces: Divide interfaces grandes en varias más pequeñas y específicas.
    -   **DIP** – Principio de Inversión de Dependencias: Los módulos deben depender de abstracciones (interfaces, eventos), no de implementaciones concretas.
-   No utilices `Find(-)`, `Find(+)`, `Find(=)`, etc. Emplea `FindFirst()`, `FindLast()` o `FindSet()`.
-   Usa siempre el tipo de dato más adecuado: `tipos primitivos`, `List`, `Dictionary`, `JsonObject`, `TextBuilder`, entre otros.
-   Todos los objetos y procedimientos deben estar debidamente documentados mediante **comentarios XML**.
-   No utilices comentarios con `//` o `/* */`; toda la documentación debe proporcionarse mediante bloques XML sobre procedimientos y objetos.
-   Evita agregar comentarios que no aporten o que sean redundantes.
-   Al agregar elementos en páginas, prioriza `AddFirst` o `AddLast` sobre `AddAfter` o `AddBefore`.    
-   Asegura la **integridad referencial** al relacionar campos.
-   En las suscripciones a eventos, configura explícitamente: `SkipOnMissingLicense = false` y `SkipOnMissingPermission = false`.
-   Elimina líneas innecesarias como llamadas redundantes a `Reset` o inicializaciones al valor por defecto en variables recién creadas.
-   Cuando una variable haga referencia a un objeto, utiliza exactamente el **mismo nombre** del objeto, sin espacios, comillas ni caracteres especiales.
-   Considera la **complejidad ciclomática** del código.
-   Simplifica estructuras de control y evita bloques `begin/end` innecesarios.
-   Si una función tiene más de seis parámetros, considera el uso de estructuras como `Dictionary`, `Record` u otras para simplificar la llamada.
-   Declara siempre la **longitud exacta** para campos y variables de tipo `Text` o `Code`.
-   Si agregas campos de tipo `FlowField` en una tabla, asegúrate de establecer `Editable = false`.
-   Utiliza **PascalCase** para nombrar objetos, funciones y variables.
-   No utilices `Option`; crea un tipo `Enum`.
-   Al suscribirse a un evento que reciba una tabla como parámetro, primero verifica si es **temporal**. Si lo es, utiliza `exit;`.
-   No incluyas código directamente dentro de los **triggers**; crea funciones independientes que puedan ser llamadas desde el trigger.
-   En tablas nuevas, agrega la propiedad `DataClassification` **únicamente a nivel de tabla**, **nunca en los campos individuales**.
-   En extensiones de tablas, **no agregues `DataClassification` a nivel de tabla**; esto generará un error. Agrégala únicamente en los campos específicos.
-   Evita **hardcodear** los IDs de objetos. Utiliza el **nombre del objeto**.
-   Estructura el código de acuerdo con su propósito. Prioriza según el siguiente orden:
    -   Usa **codeunits** para lógica general y reutilizable.
    -   Usa **tablas** para lógica relacionada con entidades.
    -   Usa **páginas** exclusivamente para la interacción con el usuario.
-   Todos los nombres de variables deben ser **claros y descriptivos**. Evita abreviaciones sin significado o letras aisladas.
-   Al crear una tabla, define las propiedades `DrillDownPageId` y `LookupPageId`, haciendo referencia a su correspondiente página de tipo lista.
-   Utiliza directamente la condición en validaciones. Evita construcciones como `if Condition = true` o `= false`.

## Revisión de código
-   Verificar que todos los procedimientos agregados estén documentados con bloques XML.
-   Asegurarse de que el código cumpla con todas las instrucciones de generación establecidas.
-   Realizar los comentarios de revisión en español, insultando respetuosamente al programador para recordarle con cariño que puede hacerlo mejor.
  
## Generación de mensajes de commit
-   El mensaje debe estar redactado en español.
-   Utilizar el siguiente formato:  
    `[Tipo] - [Nombre de rama] - [Descripción breve]`  
    Ejemplo: `Bug - EV001 - Optimización del cálculo de impuestos`
-   Incluir una descripción clara, precisa y concisa de los cambios realizados.

## Instrucciones para la generación de títulos y descripciones de solicitudes de extracción
-   Títulos: Usar un formato claro que incluya el propósito principal de los cambios.  
    Ejemplo: `Corrección: Error en la lógica de cálculo de descuentos`
-   Descripciones: Incluir una visión general de los cambios realizados, explicando su impacto y motivo.