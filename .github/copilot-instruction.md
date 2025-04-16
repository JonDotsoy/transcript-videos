# Instrucciones para Commits

Este repositorio debe seguir el estándar de [Conventional Commits](https://www.conventionalcommits.org/), que define un formato estructurado para los mensajes de commit. Esto asegura que los mensajes sean consistentes y fáciles de entender.

> **Todos los mensajes de commit deben estar escritos en inglés.**

## Áreas

El área se especifica entre paréntesis después del tipo de commit y ayuda a identificar la parte del proyecto afectada por el cambio. Ejemplos de áreas comunes:

- `transcript`: Cambios en cualquier archivo dentro del directorio `./transcript/`.

Puedes definir nuevas áreas según la estructura del proyecto y la naturaleza de los cambios.

## Tipos de Commits

2. **build**:  
   - **Cualquier cambio dentro del directorio `.github/*` debe ser siempre de tipo `build`.**
   - Archivos dentro del directorio `.github/*` (por ejemplo, workflows o configuraciones).
   - El archivo `.tool-version`.

1. **docs**:  
   Utilizar este tipo cuando el cambio afecta:
   - Archivos Markdown (`*.md`) en la raíz del proyecto.
   - Archivos de licencias (`LICENSE`, `LICENSE.md`) en la raíz del proyecto.
   
## Formato de Mensajes de Commit

Cada mensaje de commit debe seguir el siguiente formato:

```
<tipo>(<área opcional>): <descripción breve>

<mensaje descriptivo opcional>
```

### Ejemplos:

- `docs: Update README with new project information.`
- `build: Modify GitHub Actions workflow.`
- `build: Update .tool-version file.`
- `feat(transcript): Add new audio processing script.`
