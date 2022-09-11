import { lesson2_backend } from "../../declarations/lesson2_backend";

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const button = e.target.querySelector("button");

  const arr = document.getElementById("arr").value.toString();

  button.setAttribute("disabled", true);

  // Interact with foo actor, calling the greet method
  const result = await lesson2_backend.qsort(arr);

  button.removeAttribute("disabled");

  document.getElementById("greeting").innerText = result;

  return false;
});
