## Screenshots.py

This script generates screenshots of the presentation slides.

```python
{{< include screenshots.py >}}
```

The script uses playwright to take screenshots of the slides in different formats.

```toml
{{< include ./../pyproject.toml >}}
```

It can be run in a GitHub Codespace or locally with [uv](https://astral.sh/uv/).

```bash
uv run presentation/screenshots.py
```
