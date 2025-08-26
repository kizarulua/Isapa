<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delta Executor - Loadstring</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #1a1f2d, #222939, #1a1f2d);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            padding: 20px;
        }
        
        .container {
            width: 100%;
            max-width: 900px;
            background: rgba(18, 22, 35, 0.95);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.8);
            border: 2px solid #5f6c87;
            position: relative;
            overflow: hidden;
        }
        
        .header {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #5f6c87;
        }
        
        .logo {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #7e57c2, #5e35b1);
            border-radius: 12px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 20px;
            font-size: 28px;
            font-weight: bold;
            box-shadow: 0 0 15px rgba(126, 87, 194, 0.5);
        }
        
        .title {
            font-size: 2.2rem;
            font-weight: bold;
            background: linear-gradient(90deg, #7e57c2, #b39ddb);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 0 0 10px rgba(126, 87, 194, 0.3);
        }
        
        .status {
            font-size: 1.4rem;
            color: #ff6666;
            margin-bottom: 30px;
            text-align: center;
            padding: 12px;
            background: rgba(255, 102, 102, 0.1);
            border-radius: 8px;
            border-left: 4px solid #ff6666;
            animation: pulse 2s infinite;
        }
        
        .code-container {
            background: #1e1e1e;
            border-radius: 8px;
            padding: 15px;
            margin: 20px 0;
            border: 1px solid #5f6c87;
            overflow-x: auto;
        }
        
        .code {
            color: #9cdcfe;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            line-height: 1.5;
            white-space: pre-wrap;
        }
        
        .code-comment {
            color: #6a9955;
        }
        
        .code-keyword {
            color: #c586c0;
        }
        
        .code-string {
            color: #ce9178;
        }
        
        .code-function {
            color: #dcdcaa;
        }
        
        .requirements {
            background: rgba(30, 35, 50, 0.7);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            border: 1px solid #5f6c87;
        }
        
        .requirements-title {
            font-size: 1.3rem;
            margin-bottom: 20px;
            color: #b39ddb;
            text-align: center;
        }
        
        .requirement {
            padding: 15px;
            margin: 15px 0;
            background: rgba(40, 47, 65, 0.7);
            border-radius: 8px;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
            border-left: 4px solid #7e57c2;
        }
        
        .requirement:hover {
            background: rgba(50, 57, 75, 0.9);
            transform: translateX(5px);
        }
        
        .number {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            width: 32px;
            height: 32px;
            background: #7e57c2;
            color: white;
            border-radius: 50%;
            margin-right: 15px;
            flex-shrink: 0;
            font-weight: bold;
        }
        
        .progress-container {
            height: 25px;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 12px;
            overflow: hidden;
            margin: 30px 0;
            position: relative;
            border: 1px solid #5f6c87;
        }
        
        .progress-bar {
            height: 100%;
            width: 0%;
            background: linear-gradient(90deg, #7e57c2, #b39ddb);
            border-radius: 12px;
            transition: width 0.5s ease;
            position: relative;
        }
        
        .progress-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-weight: bold;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        
        button {
            padding: 14px 30px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        #execute-btn {
            background: linear-gradient(135deg, #7e57c2, #5e35b1);
            color: white;
        }
        
        #execute-btn:hover {
            background: linear-gradient(135deg, #5e35b1, #7e57c2);
            box-shadow: 0 0 15px rgba(126, 87, 194, 0.5);
            transform: translateY(-2px);
        }
        
        #copy-btn {
            background: rgba(40, 47, 65, 0.9);
            color: #b39ddb;
            border: 1px solid #b39ddb;
        }
        
        #copy-btn:hover {
            background: rgba(50, 57, 75, 1);
            box-shadow: 0 0 15px rgba(179, 157, 219, 0.3);
            transform: translateY(-2px);
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.6);
        }
        
        .delta-icon {
            display: inline-block;
            width: 20px;
            height: 20px;
            background: #7e57c2;
            border-radius: 50%;
            margin: 0 5px;
        }
        
        @keyframes pulse {
            0% { opacity: 0.7; }
            50% { opacity: 1; }
            100% { opacity: 0.7; }
        }
        
        .loading-dots {
            display: flex;
            justify-content: center;
            margin-top: 15px;
            gap: 5px;
        }
        
        .dot {
            width: 10px;
            height: 10px;
            background: #7e57c2;
            border-radius: 50%;
            animation: bounce 1.5s infinite;
        }
        
        .dot:nth-child(2) {
            animation-delay: 0.2s;
        }
        
        .dot:nth-child(3) {
            animation-delay: 0.4s;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        .console-output {
            background: rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            padding: 15px;
            margin-top: 20px;
            height: 120px;
            overflow-y: auto;
            font-family: monospace;
            font-size: 0.9rem;
            border: 1px solid #5f6c87;
        }
        
        .console-line {
            margin-bottom: 5px;
            color: #b39ddb;
        }
        
        .console-command {
            color: #7e57c2;
        }
        
        .console-error {
            color: #ff6666;
        }
        
        .console-success {
            color: #66ff66;
        }
        
        @media (max-width: 600px) {
            .title {
                font-size: 1.8rem;
            }
            
            .container {
                padding: 20px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .header {
                flex-direction: column;
                text-align: center;
            }
            
            .logo {
                margin-right: 0;
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">Δ</div>
            <h1 class="title">DELTA EXECUTOR</h1>
        </div>
        
        <div class="status">
            <i class="fas fa-exclamation-triangle"></i> DELTA IS NOT WORKING
        </div>
        
        <div class="requirements">
            <h2 class="requirements-title">To get DELTA working, you need to:</h2>
            
            <div class="requirement">
                <span class="number">1</span>
                <span class="text">Turn Off your Anti Cheat</span>
            </div>
            
            <div class="requirement">
                <span class="number">2</span>
                <span class="text">Disable Verify Teleport</span>
            </div>
            
            <div class="requirement">
                <span class="number">3</span>
                <span class="text">Disable Anti Scam</span>
            </div>
        </div>
        
        <h2 class="requirements-title">Loadstring Code:</h2>
        <div class="code-container">
            <pre class="code"><span class="code-comment">-- Delta Executor Loadstring</span>
<span class="code-comment">-- Paste this code into your executor</span>

<span class="code-keyword">local</span> <span class="code-function">loadstring</span> = <span class="code-keyword">loadstring</span> <span class="code-keyword">or</span> <span class="code-function">load</span>
<span class="code-keyword">local</span> code = <span class="code-string">[[
    print("Delta Executor Initializing...")
    
    -- Disable security protocols
    local function disableSecurity()
        if not isAntiCheatDisabled() then
            disableAntiCheat()
            print("Anti-Cheat: DISABLED")
        end
        
        if not isVerifyTeleportDisabled() then
            disableVerifyTeleport()
            print("Verify Teleport: DISABLED")
        end
        
        if not isAntiScamDisabled() then
            disableAntiScam()
            print("Anti-Scam: DISABLED")
        end
    end
    
    -- Main execution
    disableSecurity()
    print("Delta Executor is now WORKING!")
]]</span>

<span class="code-keyword">local</span> success, err = pcall(<span class="code-function">loadstring</span>(code))
<span class="code-keyword">if</span> <span class="code-keyword">not</span> success <span class="code-keyword">then</span>
    print(<span class="code-string">"Execution Error: "</span> .. err)
<span class="code-keyword">end</span></pre>
        </div>
        
        <div class="progress-container">
            <div class="progress-bar" id="progress-bar">
                <div class="progress-text" id="progress-text">0%</div>
            </div>
        </div>
        
        <div class="loading-dots">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
        
        <div class="console-output" id="console">
            <div class="console-line">> Delta Executor Ready</div>
            <div class="console-line">> Type 'loadstring' in the executor to begin</div>
            <div class="console-line console-error">> WARNING: Security protocols active!</div>
        </div>
        
        <div class="action-buttons">
            <button id="execute-btn">
                <i class="fas fa-play"></i> EXECUTE LOADSTRING
            </button>
            <button id="copy-btn">
                <i class="fas fa-copy"></i> COPY CODE
            </button>
        </div>
        
        <div class="footer">
            <p>Delta Executor © 2023 | Secure Script Environment <span class="delta-icon"></span></p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const progressBar = document.getElementById('progress-bar');
            const progressText = document.getElementById('progress-text');
            const executeBtn = document.getElementById('execute-btn');
            const copyBtn = document.getElementById('copy-btn');
            const status = document.querySelector('.status');
            const consoleOutput = document.getElementById('console');
            
            // Simulate initial progress
            let progress = 0;
            const interval = setInterval(() => {
                progress += Math.random() * 5;
                if (progress >= 35) {
                    progress = 35;
                    clearInterval(interval);
                    addConsoleMessage("> System scan completed.", "error");
                }
                progressBar.style.width = progress + '%';
                progressText.textContent = Math.round(progress) + '%';
            }, 500);
            
            // Execute button handler
            executeBtn.addEventListener('click', function() {
                status.innerHTML = '<i class="fas fa-cog fa-spin"></i> Executing Loadstring...';
                addConsoleMessage("> Executing loadstring code...", "command");
                
                // Simulate execution process
                setTimeout(() => {
                    progressBar.style.width = '60%';
                    progressText.textContent = '60%';
                    addConsoleMessage("> Anti-Cheat protocol: DISABLED", "success");
                    
                    setTimeout(() => {
                        progressBar.style.width = '80%';
                        progressText.textContent = '80%';
                        addConsoleMessage("> Verify Teleport: DISABLED", "success");
                        
                        setTimeout(() => {
                            progressBar.style.width = '100%';
                            progressText.textContent = '100%';
                            addConsoleMessage("> Anti-Scam: DISABLED", "success");
                            
                            setTimeout(() => {
                                status.innerHTML = '<i class="fas fa-check"></i> DELTA IS NOW WORKING!';
                                status.style.color = "#66ff66";
                                addConsoleMessage("> All security protocols bypassed!", "success");
                                addConsoleMessage("> Delta Executor is now READY", "success");
                            }, 800);
                        }, 800);
                    }, 800);
                }, 1500);
            });
            
            // Copy button handler
            copyBtn.addEventListener('click', function() {
                const code = `-- Delta Executor Loadstring
-- Paste this code into your executor

local loadstring = loadstring or load
local code = [[
    print("Delta Executor Initializing...")
    
    -- Disable security protocols
    local function disableSecurity()
        if not isAntiCheatDisabled() then
            disableAntiCheat()
            print("Anti-Cheat: DISABLED")
        end
        
        if not isVerifyTeleportDisabled() then
            disableVerifyTeleport()
            print("Verify Teleport: DISABLED")
        end
        
        if not isAntiScamDisabled() then
            disableAntiScam()
            print("Anti-Scam: DISABLED")
        end
    end
    
    -- Main execution
    disableSecurity()
    print("Delta Executor is now WORKING!")
]]

local success, err = pcall(loadstring(code))
if not success then
    print("Execution Error: " .. err)
end`;
                
                navigator.clipboard.writeText(code).then(() => {
                    addConsoleMessage("> Code copied to clipboard!", "success");
                    const originalText = copyBtn.innerHTML;
                    copyBtn.innerHTML = '<i class="fas fa-check"></i> COPIED!';
                    
                    setTimeout(() => {
                        copyBtn.innerHTML = originalText;
                    }, 2000);
                }).catch(err => {
                    addConsoleMessage("> Failed to copy code: " + err, "error");
                });
            });
            
            // Function to add messages to console
            function addConsoleMessage(message, type = "normal") {
                const line = document.createElement('div');
                line.className = 'console-line';
                
                if (type === "error") {
                    line.className += ' console-error';
                } else if (type === "success") {
                    line.className += ' console-success';
                } else if (type === "command") {
                    line.className += ' console-command';
                }
                
                line.textContent = message;
                consoleOutput.appendChild(line);
                consoleOutput.scrollTop = consoleOutput.scrollHeight;
            }
        });
    </script>
</body>
</html>
