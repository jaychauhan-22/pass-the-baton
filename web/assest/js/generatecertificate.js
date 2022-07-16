const generateName  = async(name,pname,org,cert,d) => {
    const  {PDFDocument,rgb} = PDFLib;
    const exBytes = await fetch("./certificate.pdf").then((res) =>{
            return res.arrayBuffer();
        });
    const exfont = await fetch("./fonts.ttf").then((res) =>{
            return res.arrayBuffer();
        });
    const pdfDoc = await PDFDocument.load(exBytes);
    pdfDoc.registerFontkit(fontkit);
    const myFont = await pdfDoc.embedFont(exfont);
    const pages = pdfDoc.getPages();
    const firstpg = pages[0]
    firstpg.drawText(name,{
        x: 400,
        y: 260,
        size: 58,
        font: myFont
    })
    firstpg.drawText(pname,{
        x: 450,
        y: 185,
        size: 32,
        font: myFont
    })
    firstpg.drawText(org,{
        x: 450,
        y: 110,
        size: 32,
        font: myFont
    })
    firstpg.drawText(cert,{
        x: 165,
        y: 575,
        size: 28,
        font: myFont
    })
    firstpg.drawText(d,{
        x: 690,
        y: 38,
        size: 26,
        font: myFont
    })
    const uri = await pdfDoc.saveAsBase64({dataUri: true})
    window.open(uri);
    document.querySelector("#mypdf").src = uri
};
