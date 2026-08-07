# Crescent-Luna

Chat-based adventure.

See [Story Architecture](ARCHITECTURE.md) for the proposed separation between
the human-friendly story source, build-time compiler, and runtime engine.

The English and Japanese story sources are maintained in
[`story/Crescent-Luna-en.story`](story/Crescent-Luna-en.story) and
[`story/Crescent-Luna-ja.story`](story/Crescent-Luna-ja.story). Run
`npm run story:check` to validate both versions, or `npm run story:build` to
compile both stories for the app.



https://toreniafournieri.github.io/Crescent-Luna/

## Story II — Luna AI (local and experimental)

Luna AI is an optional free-form storyline that talks to a model running on
your own computer through LM Studio. Start LM Studio, load a model, enable its
local API server, then run `npm run dev` and select **Story II — Luna AI**. The
default endpoint is `http://127.0.0.1:1234/v1`; it can be changed in the
in-story connection settings. `127.0.0.1` always refers to the computer of the
person viewing the page, and the conversation is sent to that configured
endpoint.

Check that the local HTTP server is available with:

```bash
curl http://127.0.0.1:1234/v1/models
```

This command does not prove that a web browser can connect. LM Studio must
allow the development site's origin through its CORS settings. The public
GitHub Pages site uses HTTPS, so browsers may also block its HTTP localhost
request because of mixed-content or local-network-access rules. For that
reason, the supported workflow is running this application locally. There is
no hosted inference proxy, and transcripts and model selections remain in the
browser's local storage.
