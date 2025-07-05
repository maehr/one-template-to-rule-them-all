## Screenshots.py

This script generates screenshots for the presentation slides.

```python
{{< include screenshots.py >}}
```

The script uses playwright to take screenshots in different formats. These are used in the presentation slides.

```toml
{{< include ./../pyproject.toml >}}
```

It can be run in a GitHub Codespace or locally with [uv](https://astral.sh/uv/).

```bash
uv run presentation/screenshots.py
```
