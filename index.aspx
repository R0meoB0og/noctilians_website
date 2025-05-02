<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="nightshop.index" MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>noctilians.com</title>
    <style>

        *:target {
            position: relative;
            left: -5%; 
        }

        html {
            position: relative;
            min-height: 100%;
            overflow-x: hidden; /* Prevents horizontal scroll */
            width: 100%;
        }

        body {
            background-image: url('/images/background.jpg');
            background-size: cover;
            background-position: center center;
            background-attachment: fixed;  /* Keeps background fixed while scrolling */
            margin: 0 0 100px;
            height: 100%;
            font-family: 'Bahnschrift Light', monospace;
            overflow-x: hidden; /* Prevents horizontal scroll */
            width: 100%;
        }

        .logo-box {    
            position: fixed;
            top: 10px;
            text-align: center;
            z-index: 96;
        }

        .logo {    
            width: 25%;
        }

        .imgbtn {
            position: relative;       
            top: 5%;
            width: 10%;
            margin-left: 5vw;
            height: auto;
            cursor: pointer;      
            border: none;          
        }


        /* make the title look dope */
        h1 {
            color: white;
            font-size: 5vw;
            text-shadow: 2px 2px 4px #171414;
          }

        h2 {
            font-size: 1.8vw;
            color: white;
            text-shadow: 2px 2px 4px #171414;
        }

        p {
            color: white;
            font-size: 1vw;
        }

        a {
            color: white; /* Makes text white */
            text-decoration: none; /* Removes underline */
        }

        a:hover {
            color: #ccc; /* Light gray on hover */
        }


        .center-container {
            position: relative;
            margin-top: 2.5%;
            text-align: center;
        }

        .the-end {
            position: relative;
            margin-top: 5%;
            margin-bottom: 0;
            text-align: center;
            color: white;
            font-size: 1.2vw;
        }

        .section_header {
            position: relative;
            text-align: left;
            left: 5%;
            scroll-margin-top: 30px; 
            scroll-margin-left: 100px;
        }

        .leftmost-word {
            position: fixed;
            text-align: left;
            left: 5%;
            top: 10px;
            z-index: 100;
        }

        .left-word {
            position: fixed;
            text-align: left;
            left: 22%;
            top: 10px;
            z-index: 99;
        }

        .rightmost-word {
            position: fixed;
            text-align: right;
            right: 5%;
            top: 10px;
            z-index: 98;
        }

        .right-word {
            position: fixed; 
            text-align: right;
            right: 22%;
            top: 10px;
            z-index: 97;
        }

        .box {
          position: relative;
          display: flex;
          justify-content: space-between;
          background-color: #380e8e;
          flex-wrap: wrap;
          width: 100%;
          max-width: 100%;
          box-sizing: border-box;
        }

        .box > * {
            position: relative;
            padding-left: 15%;
            padding-top: 4%;
            padding-bottom: 4%;
            line-height: 1.8;
            font-size: 1.1em;
            color: white;
            text-shadow: 2px 2px 4px #171414;
            flex: 1 1 35%;
            box-sizing: border-box;
        }

        .music-box {
          position: relative;
          display: flex;
          justify-content: space-between;
          background-color: #380e8e;
          flex-wrap: wrap;
          width: 100%;
          max-width: 100%;
          box-sizing: border-box;
        }

        .music-box > * {
            position: relative;
            margin-left: 13%;
            margin-top: 4%;
            line-height: 1.8;
            font-size: 1.1em;
            color: white;
            text-shadow: 2px 2px 4px #171414;
            flex: 1 1 35%;
            box-sizing: border-box;
        }

        .normbutton{
            font-family: 'Bahnschrift Light', monospace;
            font-size: 1.1em;
            padding: 0;
            color: white;
            text-shadow: 2px 2px 4px #171414;
            border: hidden;
            outline: none;
            cursor: pointer;
        }

        .p1img {
            width: 30vw;     
            height: auto;      /* Maintain aspect ratio */
            transition: border 0.3s ease-in-out; /* Smooth hover effect */
            border: 4px solid #290a5a; 
        }

        .p2img {
            width: 20vw;     
            height: auto;      /* Maintain aspect ratio */
            transition: border 0.3s ease-in-out; /* Smooth hover effect */
            border: 4px solid #290a5a; 
        }

        .flat-button {
            color: white; /* White text */
            border: thin;
            border-style: solid;
            border-color: white;
            cursor: pointer; /* Add a pointer cursor */
            transition: border 0.3s ease-in-out; /* Smooth hover effect */
        }

        .flat-button:hover {
            box-shadow: 4px 4px white;
        }

        .flat-button:focus {
            outline: none; /* Remove focus outline */
        }

        .anchor{
            top: -5vw;
        }

        iframe {
            border-style: solid;
            border-color: #290a5a;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">

            <!-- Logo -->
            <div class="logo-box">
            <a href="index.aspx">
            <asp:Image ID="Image1" runat="server" src="/images/logo.png" alt="logo" CssClass="logo" />
            </a>
            </div>

            <div class="leftmost-word"> <h2> <a href="#concerts"> CONCERTS </a> </h2> </div>
            <div class="left-word"> <h2> <a href="#music"> MUSIC </a> </h2> </div>
            <div class="right-word"> <h2> <a href="#lore"> LORE </a> </h2> </div>
            <div class="rightmost-word"> <h2> <a href="#contact"> CONTACT </a> </h2> </div>
            

                <br />
                <br />
                <br />
                <br />
                <br />
                <br />


                <div class="center-container">
                    <!-- luscious D album image container -->
                    <a href="#music">
                        <asp:Image ID="Image2" runat="server" src="/images/LDCover.jpg" CssClass="p1img" />
                    </a>

                    <br />
                    <br />

                </div>


                <br />
                <br />
                <br />
                <br />

                <span class="anchor" id="concerts"></span>
                <div class="section_header">
                    <h1> CONCERTS </h1>
                </div>

                   <div class="box">
                       <div> 
                           <b>WED 14/05</b>
                           <br />
                           Supersonic, 21:00
                           <br />
                           9 rue Biscornet, Paris 
                       </div>
                       <div>
                           <br />
                           <asp:Button ID="Button1" CssClass="flat-button" runat="server" Text="DETAILS" BackColor="#380e8e" OnClick="Button1_Click" ForeColor="White" Font-Size="Larger" Height="40px" Width="120px"></asp:Button>
                       </div>

                   </div>

                <br />
                <br />
                <br />
                <br />
                
                <span class="anchor" id="music"></span>
                <div class="section_header">
                    <h1> MUSIC </h1>
                </div>
                    
                <div class="music-box">
                    <div> <asp:Image ID="LD" runat="server" src="/images/LDCover.jpg" CssClass="p2img"/> </div>
                    <div> 
                        <br />
                        <br />
                        <b>Luscious Demise.</b> Released July 2024. 
                        <br />
                        <br />
                        <asp:Button ID="Button7" CssClass="flat-button" runat="server" Text="LISTEN" BackColor="#380e8e" OnClick="Button7_Click" ForeColor="White" Font-Size="Larger" Height="40px" Width="120px"></asp:Button>
                    </div>
                    <div> <asp:Image ID="OS" runat="server" src="/images/Outsider_cover.png" CssClass="p2img"/> </div>
                    <div> 
                        <br />
                        <br />
                        <b>Outsider.</b> Released October 2023. 
                        <br />
                        <br />
                        <asp:Button ID="Button8" CssClass="flat-button" runat="server" Text="LISTEN" BackColor="#380e8e" OnClick="Button7_Click" ForeColor="White" Font-Size="Larger" Height="40px" Width="120px"></asp:Button>
                    </div>
                    <div> <asp:Image ID="BT" runat="server" src="/images/Betise_cover.jpg" CssClass="p2img"/> </div>
                    <div> 
                        <br />
                        <br />
                        <b>Bêtise.</b> Released September 2022. 
                        <br />
                        <br />
                        <asp:Button ID="Button9" CssClass="flat-button" runat="server" Text="LISTEN" BackColor="#380e8e" OnClick="Button7_Click" ForeColor="White" Font-Size="Larger" Height="40px" Width="120px"></asp:Button>
                    </div>
                    <div> <asp:Image ID="EP" runat="server" src="/images/EP_cover.png" CssClass="p2img"/> </div>
                    <div>
                        <br />
                        <br />
                        <b>Noctilians EP.</b> Released April 2022. 
                        <br />
                        <br />
                        <asp:Button ID="Button10" CssClass="flat-button" runat="server" Text="LISTEN" BackColor="#380e8e" OnClick="Button7_Click" ForeColor="White" Font-Size="Larger" Height="40px" Width="120px"></asp:Button>
                    </div>
                    <div></div>
                </div> 

                <br />
                <br />
                <br />
                <br />

                <span class="anchor" id="lore"></span>
                <div class="section_header">
                    <h1> LORE </h1>
                </div>
                
                <div class="box">
                    <div> <h2>VIDEOS</h2> 
                        <br />
                        <br />
                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="JULIELOVESTOBOOGIE" CssClass="normbutton" BackColor="#380e8e"></asp:Button>
                        <br />
                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="OUTSIDER" CssClass="normbutton" BackColor="#380e8e"></asp:Button>
                        <br />
                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="BÊTISE" CssClass="normbutton" BackColor="#380e8e"></asp:Button>
                    </div>
                    <div>
                        <br />
                        <br />
                        <br />
                        <iframe id="YT" width="300" height="180" src="/images/glitch.jpeg">
                        </iframe>

                        <script>
                        function changeIframeSrc(newSrc) {
                            document.getElementById('YT').src = newSrc;
                        }
                        </script>

                    </div>

                    <div> <h2>TALES</h2> 
                        <br />
                        <br />
                        Noctilians is not just a couple of songs strung together. Original creators and collaborators alike have come 
                        together to build a world around the nostalgic, enigmatic universe captured in the music. Here, you can discover 
                        the tantalizing stories that encapsulate the essence of Noctilia. 
                    </div>
                    <div></div>

                </div>

                <br />
                <br />
                <br />
                <br />

                <span class="anchor" id="contact"></span>
                <div class="section_header">
                    <h1> CONTACT </h1>
                </div>

                <div class="box">
                    <div>
                        <br />
                        BOOK US: contact.noctilians@gmail.com
                    </div>

                    <div> 
                        <a href="https://www.instagram.com/noctilians?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==">
                            <asp:Image ID="Insta" src="/images/Insta.png" runat="server" CssClass="imgbtn"/>
                        </a>
                        <a href="https://youtube.com/@noctilians9319?si=iWbjjuchiV5rM8Og">
                           <asp:Image ID="YT" src="/images/YT.png" runat="server" CssClass="imgbtn"/>
                        </a>                
                        <a href="https://youtube.com/@noctilians9319?si=iWbjjuchiV5rM8Og">
                            <asp:Image ID="Tik" src="/images/Tik.png" runat="server" CssClass="imgbtn"/>
                        </a>
                    </div>
                </div>

                <br />
                <br />
                <br />
                <br />

                <div class="the-end">
                    © Noctilians 2025 
                </div>

    </form>
</body>
</html>
