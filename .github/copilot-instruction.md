# Instrucciones para Commits

Este repositorio debe seguir el estándar de [Conventional Commits](https://www.conventionalcommits.org/), que define un formato estructurado para los mensajes de commit. Esto asegura que los mensajes sean consistentes y fáciles de entender.

## Tipos de Commits

1. **docs**:  
   Utilizar este tipo cuando el cambio afecta:
   - Archivos Markdown (`*.md`) en la raíz del proyecto.
   - Archivos de licencias (`LICENSE`, `LICENSE.md`) en la raíz del proyecto.

2. **build**:  
   Utilizar este tipo cuando el cambio afecta:
   - Archivos dentro del directorio `.github/` (por ejemplo, workflows o configuraciones).
   - El archivo `.tool-version`.

## Formato de Mensajes de Commit

Cada mensaje de commit debe seguir el siguiente formato:

```
<tipo>(<área opcional>): <descripción breve>

<mensaje descriptivo opcional>
```

### Ejemplos:

- `docs: Actualiza el README con nueva información sobre el proyecto.`
- `build: Modifica el workflow de GitHub Actions.`
- `build: Actualiza la versión del archivo .tool-version.`
