--[[
    This is a lua script which adds hover documentation to all exploit functions. 
        - made wtih chatgpt using sirhurts documentation
]]--

-- Cache
-- Removes object from the Instance cache.
function cache.invalidate(object: Instance): ()
 -- Checks whether object is in the Instance cache.
 function cache.iscached(object: Instance): boolean
 -- Replaces the old with new in the Instance cache.
 function cache.replace(old: Instance, new: Instance): ()
 -- Closures
 -- Checks whether the current function was called by SirHurt.
 function checkcaller(): boolean
 -- Returns a new closure which behaves identically to cl.
 function clonefunction<T>(cl: T): T
 -- Returns the script which invoked the current function.
 function getcallingscript(): BaseScript
 -- Routes the calls from cl to hook. Returns a clone of the original function.
 function hookfunction<T>(cl: T, hook: function): T
 -- Checks whether cl has been hooked with hookfunction.
 function isfunctionhooked(cl: (...any) -> any): boolean
 -- Removes all hooks applied to the target function, restoring it to its original state.
 function restorefunction(cl: (...any) -> any): ()
 -- Checks whether cl is a C function.
 function iscclosure(cl: (...any) -> any): boolean
 -- Checks whether cl is a Luau function.
 function islclosure(cl: (...any) -> any): boolean
 -- Checks whether cl originates from a script ran with SirHurt.
 function isexecutorclosure(cl: (...any) -> any): boolean
 -- Crypt
 -- Encodes a string into Base64.
 function crypt.base64encode(data: string): string
 -- Decodes a Base64 encoded string.
 function crypt.base64decode(encoded: string): string
 -- Encrypts an unencoded string using AES encryption, returns the base64 encoded and encrypted string alongside the IV.
 function crypt.encrypt(data: string, key: string, iv: string?, mode: string?): (string, string)
 -- Decrypts a base64 encoded and encrypted string.
 function crypt.decrypt(data: string, key: string, iv: string, mode: string): string
 -- Generates a random sequence of bytes with the given size.
 function crypt.generatebytes(size: number): string
 -- Generates a base64 encoded 256-bit key.
 function crypt.generatekey(): string
 -- Hashes the data based on the provided algorithm.
 function crypt.hash(data: string, algorithm: string): string
 -- Debug
 -- Returns the constant at index in the constant table of the function or level cl.
 function debug.getconstant(cl: ((...any) -> any) | number, index: number): any
 -- Returns the constant table of the function or level cl.
 function debug.getconstants(cl: ((...any) -> any) | number): any
 -- Returns debug information about a function or stack level.
 function debug.getinfo(cl: ((...any) -> any) | number): DebugInfo
 -- Returns the proto at index in the function or level cl.
 function debug.getproto(cl: ((...any) -> any) | number, index: number, active: boolean?): ((...any) -> any) | { (...any) -> any }
 -- Returns a list of protos of the function or level cl.
 function debug.getprotos(cl: ((...any) -> any) | number): { (...any) -> any }
 -- Returns the value at index in the stack frame level.
 function debug.getstack(level: number, index: number?): any | { any }
 -- Drawing
 -- Creates a new drawing of the specified type.
 function Drawing.new(type: string): DrawingObject
 -- Destroys every drawing object in the cache, invalidates any references.
 function cleardrawcache(): ()
 -- Gets the value of a property of a drawing.
 function getrenderproperty(drawing: DrawingObject, property: string): any
 -- Checks whether the passed object is a drawing.
 function isrenderobj(object: any): boolean
 -- Sets the value of a property of a drawing.
 function setrenderproperty(drawing: DrawingObject, property: string, value: any): ()
 -- Filesystem
 -- Returns the contents of the file located at path.
 function readfile(path: string): string
 -- Returns a list of all files in folder path.
 function listfiles(path: string): { string }
 -- Writes data to file at path.
 function writefile(path: string, data: string): ()
 -- Creates a folder at path if there doesn't exist one already.
 function makefolder(path: string): ()
 -- Appends data to file at path.
 function appendfile(path: string, data: string): ()
 -- Checks whether path points to a valid file.
 function isfile(path: string): boolean
 -- Checks whether path points to a valid folder.
 function isfolder(path: string): boolean
 -- Deletes the file at path.
 function delfile(path: string): ()
 -- Deletes the folder at path.
 function delfolder(path: string): ()
 -- Loads the contents of a file at path as a chunk of Lua code.
 function loadfile(path: string, chunkname: string?): (((...any) -> any)?, string?)
 -- Executes the contents of file at path.
 function dofile(path: string): ()
 -- Input
 -- Returns whether the game's window is in focus.
 function isrbxactive(): boolean
 -- Clicks the left mouse button.
 function mouse1click(): ()
 -- Presses the left mouse button.
 function mouse1press(): ()
 -- Releases the left mouse button.
 function mouse1release(): ()
 -- Clicks the right mouse button.
 function mouse2click(): ()
 -- Presses the right mouse button.
 function mouse2press(): ()
 -- Releases the right mouse button.
 function mouse2release(): ()
 -- Moves the cursor to the specified coordinates.
 function mousemoveabs(x: number, y: number): ()
 -- Adjusts the cursor by the specified coordinates.
 function mousemoverel(x: number, y: number): ()
 -- Scrolls the mouse by the specified number of pixels.
 function mousescroll(pixels: number): ()
 -- Instances
 -- Dispatches a click to the passed ClickDetector.
 function fireclickdetector(object: ClickDetector): ()
 -- Dispatches an interaction to the passed ProximityPrompt.
 function fireproximityprompt(object: ProximityPrompt): ()
 -- Dispatches a touch event to the passed "from" instance as the toucher.
 function firetouchinterest(from: Instance, to: Instance, type: number): ()
 -- Returns the function assigned to a callback property of an object.
 function getcallbackvalue(object: Instance, property: string): ((...any) -> any)?
 -- Creates a list of connection proxies for the given signal.
 function getconnections(signal: RBXScriptSignal): { ConnectionProxy }
 -- Returns a content ID for the asset located at the specified path.
 function getcustomasset(path: string, noCache: boolean): string
 -- Returns the value of a property of an object, and whether the property is scriptable.
 function gethiddenproperty(object: Instance, property: string): (any, boolean)
 -- Metatable
 -- Returns the metatable of the given object.
 function getrawmetatable(object: any): { any: any }
 -- Swaps the metamethod of an object with a hook, returning the original metamethod.
 function hookmetamethod(object: any, method: string, hook: (...any) -> any): (...any) -> any
 -- Returns the name of the method that invoked the `__namecall` metamethod.
 function getnamecallmethod(): string
 -- Returns whether the object is frozen or readonly.
 function isreadonly(object: any): boolean
 -- Sets the metatable of an object to the specified metatable.
 function setrawmetatable(object: any, metatable: { [any]: any }): ()
 -- Sets whether an object is frozen or readonly.
 function setreadonly(object: any, readonly: boolean): ()
 -- Misc
 -- Returns "SirHurt" alongside the current version.
 function identifyexecutor(): (string, string)
 -- Compresses data using LZ4 compression.
 function lz4compress(data: string): string
 -- Decompresses data using LZ4 compression.
 function lz4decompress(data: string, size: number): string
 -- Creates a Windows message box.
 function messagebox(text: string, caption: string, flags: number): number
 -- Queues the specified script to be executed after the player teleports to a different place.
 function queue_on_teleport(code: string): ()
 -- Sends an HTTP request using the specified options. Yields until the request completes.
 function request(options: HttpRequest): HttpResponse
 -- Copies text to the clipboard.
 function setclipboard(text: string): ()
 -- Sets the FPS cap to the specified value.
 function setfpscap(fps: number): ()
 -- Gets the user's HWID.
 function gethwid(): string
 -- Returns a list of all scripts.
 function getscripts(): { ModuleScript | LocalScript }
 -- Returns the identity of the current thread.
 function getthreadidentity(): number
 -- Sets the identity of the current thread.
 function setthreadidentity(identity: number): ()
 -- Actor
 -- Runs code on the passed actor's state.
 function run_on_actor(actor: Actor, code: string): ()
 -- Returns a list of all actors in the game.
 function getactors(): { Actor }
 -- Returns a list of all actors parented to nil (experimental).
 function getdeletedactors(): { Actor } 
