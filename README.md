# color-data

create and store data for all **known available palette colors** in R using `paletteer`

dataset (main) features:

- `pal_function`: the palette function name to call using `paletteer`, as well as a way to identify whether the palette is a **continuous or discrete** palette

- `package`: the package that the palette is from

- `palette`: the name of the palette

- `type`: type of the palette (sequential, diverging, qualitative...)

- `creatorName`: the creator of the palette

- `maintainerName`: the maintainers of the palette

- `projectURL`: the URL of the project where the palette is from

- `description`: a description of the package from the package's documentation

- `colors`: the colors of the palette is a character, comma-separated string
