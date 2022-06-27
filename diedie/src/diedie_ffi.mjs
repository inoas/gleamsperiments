export function exit(code, maybe_message) {
  let message = (function () {
    switch (maybe_message.constructor.name) {
      case "Some":
        return maybe_message["0"];
      case "None":
        return null;
    }
  })();

  if (code === 0 && message !== null) {
    console.log(`Quit: ${message}\n`);
  } else if (code !== 0 && message !== null) {
    console.log(`Abort (${code}): ${message}\n`);
  } else if (code !== 0) {
    console.log(`Abort (${code})\n`);
  }

  process.exit(code);
}
