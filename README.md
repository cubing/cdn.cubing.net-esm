# `cdn.cubing.net`

## JavaScript Modules (`/js`)

For now, look [here](./src/js/src/) for a list of packages.

Example:

```html
<script type="module" defer>
  import "https://cdn.cubing.net/js/scramble-display";
  import { Alg } from "https://cdn.cubing.net/js/cubing/alg";

  // Invert the scramble when you click the display.
  const disp = document.querySelector("#disp");
  disp.addEventListener("click", () => {
    disp.scramble = Alg.fromString(disp.scramble).invert().toString();
  });
</script>
<scramble-display id="disp" scramble="R U R'"></scramble-display>
```
