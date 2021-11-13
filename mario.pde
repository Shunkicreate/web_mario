//左右キーでマリオの移動、マウスのクリックで、ジャンプができます。クリボーは踏むことができ、横からあたると死にます。土管に入るともう片方の土管から出ることができます。
//土管の上に乗ることはできますが、上ででジャンプしないでください。


int mx = 300;//マリオ　座表
float my = 500;
int w = 5;

float i = 1;
float s = w * 0.7;
float a = 1700;
float v = 1000;
float t = 0.017;
int g = 1500;
int swich = 0;
//土管
int A = 500 - 32 * w;
int b = 1800;
//地面
int ground = 0;
int groundy = 501;
//初期位相
float Y0;
//クリボー
int kx = 1500;
int ky = 500;
int kv = 2;

void setup() {
    size(1800, 800);
}

void mario(int x,float Y) {
    float y = Y - 7 * w;
    if(keyPressed) {
        i += 1;
}
    if (i >=  10) {
        i = 1;
}
    if (i <=  5) {
        //mario stop
        fill(126, 138, 38);//green
        rect(x - w, y - w, 2 * w, 2 * w);
        rect(x + w, y - w, w, w);
        rect(x - 4 * w, y - w, 2 * w, 4 * w);
        rect(x - 5 * w, y, w, w * 2);
        rect(x - 6 * w, y + w, w, w);
        rect(x + 2 * w, y, 3 * w, 3 * w);
        rect(x + 5 * w, y + w, w, w);
        rect(x - 5 * w, y + 6 * w, 3 * w, 2 * w);
        rect(x - 6 * w, y + 7 * w, w, w);
        rect(x + w * 2, y + 6 * w, 3 * w, 2 * w);
        rect(x + 5 * w, y + 7 * w, w, w);
        rect(x - 5 * w, y - 5 * w, 10 * w, 3 * w);
        rect(x - 4 * w, y - 6 * w, 6 * w, w);
        
        //yellow
        fill(248, 182, 0);
        rect(x - 6 * w, y + 3 * w, 12 * w, 2 * w);
        rect(x - 6 * w, y + 2 * w, 2 * w, w);
        rect(x - 2 * w, y + 2 * w, w, w);
        rect(x + w, y + 2 * w, w, w);
        rect(x + 4 * w, y + 2 * w, 2 * w, w);
        rect(x - 3 * w, y - 2 * w, 7 * w, w);
        rect(x - 3 * w, y - 3 * w, 4 * w, w);
        rect(x - w, y - 4 * w, 3 * w, w);
        rect(x - 2 * w, y - 5 * w, 3 * w, w);
        rect(x - w, y - 6 * w, 2 * w, w);
        rect(x - 4 * w, y - 5 * w, w, 2 * w);
        rect(x + 3 * w, y - 4 * w, 3 * w, w);
        rect(x + 3 * w, y - 5 * w, 2 * w, w);
        rect(x + 2 * w, y - 6 * w, w, 2 * w);
        
        //red
        fill(230, 0, 46);
        rect(x - 3 * w, y - 8 * w, 5 * w, w);
        rect(x - 4 * w, y - 7 * w, 9 * w, w);
        rect(x - 2 * w, y - w, w, 3 * w);
        rect(x + w, y, w, 2 * w);
        rect(x - w, y + w, 2 * w, 4 * w);
        rect(x - 3 * w, y + 2 * w, w, w);
        rect(x - 3 * w, y + 2 * w, w, w);
        rect(x - 3 * w, y + 3 * w, 6 * w, w);
        rect(x - 4 * w, y + 4 * w, 3 * w, 2 * w);
        rect(x + w, y + 4 * w, 3 * w, 2 * w);
} else{
        
        //mario run
        
        //head
        fill(230, 0, 46);
        rect(x - 3 * w, y - 8 * w, 5 * w, w);
        rect(x - 4 * w, y - 7 * w, 9 * w, w);
        
        fill(126, 138, 38);
        rect(x - 5 * w, y - 5 * w, 10 * w, 3 * w);
        rect(x - 4 * w, y - 6 * w, 6 * w, w);
        
        fill(248, 182, 0);
        rect(x - 3 * w, y - 2 * w, 7 * w, w);
        rect(x - 3 * w, y - 3 * w, 4 * w, w);
        rect(x - w, y - 4 * w, 3 * w, w);
        rect(x - 2 * w, y - 5 * w, 3 * w, w);
        rect(x - w, y - 6 * w, 2 * w, w);
        rect(x - 4 * w, y - 5 * w, w, 2 * w);
        rect(x + 3 * w, y - 4 * w, 3 * w, w);
        rect(x + 3 * w, y - 5 * w, 2 * w, w);
        rect(x + 2 * w, y - 6 * w, w, 2 * w);
        
        //後ろ手
        fill(248, 182, 0);
        rect(x - 8 * w, y, 2 * w, 3 * w);
        rect(x - 6 * w, y + w, w, w);
        //central botton
        rect(x - w, y + w, w, w);
        //前手
        rect(x + 4 * w, y, 3 * w, w);
        rect(x + 5 * w, y + w, 2 * w, w);
        //オーバーオール
        fill(230, 0, 46);
        rect(x - 2 * w, y - w, 2 * w, 2 * w);
        rect(x, y, w, w);
        rect(x - 2 * w, y + w, w, w);
        rect(x, y + w, 3 * w, w);
        rect(x - 4 * w, y + 2 * w, 7 * w, w);
        rect(x - 5 * w, y + 3 * w, 9 * w, w);
        rect(x - 6 * w, y + 4 * w, 10 * w, w);
        rect(x + w, y + 5 * w, 3 * w, w);
        rect(x - 5 * w, y + 5 * w, 3 * w, w);
        
        //後ろ肩
        fill(126, 138, 38);
        rect(x - 6 * w, y - w, w * 4, w * 2);
        rect(x - 4 * w, y + w, 2 * w, w);
        //前肩
        rect(x, y - w, 2 * w, w);
        rect(x + w, y, 3 * w, w);
        rect(x + 3 * w, y + w, 2 * w, w);
        //前足
        rect(x + 4 * w, 3 * w + y, 2 * w, 3 * w);
        rect(x + 5 * w, y + 2 * w, w, w);
        //後ろ足
        rect(x - 7 * w, y + 5 * w, 2 * w, w);
        rect(x - 7 * w, y + 6 * w, 3 * w, w);
        rect(x - 7 * w, y + 7 * w, 4 * w, w);
}
    
}
void mariojump(int x,float Y) {
    float y = Y - 7 * w;  
    //mario jump
    //head
    fill(230, 0, 46);
    rect(x - 3 * w, y - 8 * w, 5 * w, w);
    rect(x - 4 * w, y - 7 * w, 9 * w, w);
    
    
    fill(126, 138, 38);//greeeeen
    rect(x - 5 * w, y - 5 * w, 10 * w, 3 * w);
    rect(x - 4 * w, y - 6 * w, 6 * w, w);
    rect(x + 5 * w, y - 3 * w, w, w);
    rect(x + 4 * w, y - 2 * w, w, w);
    
    fill(248, 182, 0); //yellow
    rect(x - 3 * w, y - 2 * w, 7 * w, w);
    rect(x - 3 * w, y - 3 * w, 4 * w, w);
    rect(x - w, y - 4 * w, 3 * w, w);
    rect(x - 2 * w, y - 5 * w, 3 * w, w);
    rect(x - w, y - 6 * w, 2 * w, w);
    rect(x - 4 * w, y - 5 * w, w, 2 * w);
    rect(x + 3 * w, y - 4 * w, 3 * w, w);
    rect(x + 3 * w, y - 5 * w, 2 * w, w);
    rect(x + 2 * w, y - 6 * w, w, 2 * w);
   ;
    
    
    //前腕
    fill(230, 0, 46);
    rect(x + 4 * w, y - 7 * w, w, 3 * w);
    rect(x + 5 * w, y - 6 * w, w, 2 * w);
    rect(x + 6 * w, y - 6 * w, w, 3 * w);
    
    fill(248, 182, 0);
    rect(x + 4 * w, y - 9 * w, 3 * w, 2 * w);
    rect(x + 5 * w, y - 7 * w, 2 * w, w);
    
    //後ろ腕
    rect(x - 9 * w, y + w, 3 * w, 2 * w);
    rect(x - 8 * w, y + 3 * w, w, w);
    
    
    //オーバーオール
    fill(230, 0, 46);
    rect(x - 2 * w, y - w, 5 * w, w);
    rect(x - w, y, 5 * w, 2 * w);
    rect(x - 5 * w, y + 2 * w, 10 * w, 3 * w);
    rect(x - 5 * w, y + 5 * w, 7 * w, w);
    rect(x - 5 * w, y + 6 * w, 4 * w, w);
    
    //前足
    fill(126, 138, 38);
    rect(x + 5 * w, y + 2 * w, w, 3 * w);
    rect(x + 6 * w, y, w, 5 * w);
    
    //後ろ足
    rect(x - 6 * w, y + 3 * w, w, w);
    rect(x - 7 * w, y + 4 * w, w * 3, w);
    rect(x - 8 * w, y + 5 * w, 3 * w, w);
    rect(x - 8 * w, y + 6 * w, w, w);
    
    //残り首から下
    rect(x - 7 * w, y - w, 5 * w, w);
    rect(x - w, y - w, 3 * w, w);
    rect(x + 3 * w, y - w, w, w);
    rect(x - 8 * w, y, 7 * w, w);
    rect(x, y, 3 * w, w);
    rect(x - 7 * w, y + w, 6 * w, w);
    rect(x - 3 * w, y + 2 * w, w, w);
    
    //ボタン
    fill(248, 182, 0);
    rect(x, y + 2 * w, w, w);
    rect(x + 3 * w, y + 2 * w, w, w);
}

void blocks() {
    //地面
    fill(212, 81, 1);
    rect(0, 501, 1800, 300);
    for (groundy = 501; groundy < 800; groundy = groundy + 16 * w) {
        for (ground = 0; ground < 1800; ground = ground + 16 * w) {
            fill(42, 12, 0);
            rect(ground, groundy, w, 16 * w);
            rect(ground + w, groundy + 10 * w, 2 * w, w);
            rect(ground + 3 * w, groundy + 11 * w, 2 * w, w);
            rect(ground + 5 * w, groundy + 12 * w, 3 * w, w);
            rect(ground + 8 * w, groundy + 12 * w, w, 3 * w);
            rect(ground + 9 * w, groundy + 10 * w, w, 2 * w);
            rect(ground + 10 * w, groundy, w, 10 * w);
            rect(ground + 12 * w, groundy + 4 * w, w, 2 * w);
            rect(ground + 13 * w, groundy + 5 * w, 3 * w, w);
            rect(ground + 2 * w, groundy + 15 * w, 6 * w, w);
            rect(ground + 10 * w, groundy + 15 * w, 6 * w, w);
            
            fill(255, 199, 177);
            rect(ground, groundy, 10 * w, w);
            rect(ground + 12 * w, groundy, 4 * w, w);
            rect(ground + w, groundy + w, w, 9 * w);
            rect(ground + w, groundy + 11 * w, w, 4 * w);
            rect(ground, groundy + 15 * w, 2 * w, w);
            rect(ground + 2 * w, groundy + 11 * w, w, w);
            rect(ground + 3 * w, groundy + 12 * w, 2 * w, w);
            rect(ground + 5 * w, groundy + 13 * w, 3 * w, w);
            rect(ground + 9 * w, groundy + 12 * w, w, 3 * w);
            rect(ground + 8 * w, groundy + 15 * w, 2 * w, w);
            rect(ground + 10 * w, groundy + 10 * w, w, 2 * w);
            rect(ground + 11 * w, groundy + w, w, 9 * w);
            rect(ground + 12 * w, groundy + 7 * w, 4 * w, w);
        }
}
}
void kuribou(int kx,float ky) {
    
    //茶色
    fill(148, 78, 31);
    rect(kx, ky - 16 * w, 2 * w, 10 * w);
    rect(kx + 2 * w, ky - 15 * w, w, 9 * w);
    rect(kx + 3 * w, ky - 14 * w, w, 9 * w);
    rect(kx + 4 * w, ky - 13 * w, w, 8 * w);
    rect(kx + 5 * w, ky - 12 * w, w, 7 * w);
    rect(kx + 6 * w, ky - 11 * w, w, 6 * w);
    rect(kx + 7 * w, ky - 9 * w, w, 3 * w);
    
    rect(kx - 2 * w, ky - 16 * w, 2 * w, 10 * w);
    rect(kx - 3 * w, ky - 15 * w, w, 9 * w);
    rect(kx - 4 * w, ky - 14 * w, w, 9 * w);
    rect(kx - 5 * w, ky - 13 * w, w, 8 * w);
    rect(kx - 6 * w, ky - 12 * w, w, 7 * w);
    rect(kx - 7 * w, ky - 11 * w, w, 6 * w);
    rect(kx - 8 * w, ky - 9 * w, w, 3 * w);
    
    
    //黒
    //目
    fill(2, 0, 1);
    rect(kx, ky - 10 * w, 2 * w, w);
    rect(kx + 2 * w, ky - 11 * w, w, 3 * w);
    rect(kx + 3 * w, ky - 12 * w, 2 * w, w);
    
    rect(kx - 2 * w, ky - 10 * w, 2 * w, w);
    rect(kx - 3 * w, ky - 11 * w, w, 3 * w);
    rect(kx - 5 * w, ky - 12 * w, 2 * w, w);
    //足
    rect(kx + 4 * w, ky - 4 * w, 2 * w, w);
    rect(kx + 2 * w, ky - 3 * w, 5 * w, w);
    rect(kx + w, ky - 2 * w, 6 * w, w);
    rect(kx + w, ky - w, 5 * w, w);
    rect(kx - 6 * w, ky - 4 * w, 2 * w, w);
    rect(kx - 7 * w, ky - 3 * w, 5 * w, w);
    rect(kx - 7 * w, ky - 2 * w, 6 * w, w);
    rect(kx - 6 * w, ky - w, 5 * w, w);
    
    //肌色
    fill(255, 205, 206);
    //目
    rect(kx + w, ky - 9 * w, w, 2 * w);
    rect(kx + 2 * w, ky - 8 * w, w, w);
    rect(kx + 3 * w, ky - 11 * w, w, 4 * w);
    rect(kx - 2 * w, ky - 9 * w, w, 2 * w);
    rect(kx - 3 * w, ky - 8 * w, w, w);
    rect(kx - 4 * w, ky - 11 * w, w, 4 * w);
    //茎
    rect(kx - 3 * w, ky - 6 * w, 6 * w, w);
    rect(kx - 4 * w, ky - 5 * w, 8 * w, 2 * w);
    rect(kx - 2 * w, ky - 3 * w, 4 * w, w);
    rect(kx - w, ky - 2 * w, 2 * w, 2 * w);
    
    
    
}
void leftdokan() {
    //土管 左
    b = 1800;
    A = 500 - 32 * w;
    fill(0);
    rect(b - 16 * w, A + 2 * w, 16 * w, w);
    rect(b - 16 * w, A + 29 * w, 16 * w, w);
    rect(b - 17 * w, A + 2 * w, w, 28 * w);
    rect(b - 18 * w, A, w, 32 * w);
    rect(b - 32 * w, A, w, 32 * w);
    rect(b - 31 * w, A, 13 * w, w);
    rect(b - 32 * w, A + 31 * w, 14 * w, w);
    
    fill(139, 214, 0);
    rect(b - 31 * w, A + w, 13 * w, 30 * w);
    rect(b - 16 * w, A + 3 * w, 16 * w, 26 * w);
    
    fill(15, 150, 0);
    rect(b - 30 * w, A + w, w, 5 * w);
    rect(b - 30 * w, A + 12 * w, w, 19 * w);
    rect(b - 29 * w, A + 4 * w, 11 * w, 2 * w);
    rect(b - 29 * w, A + 12 * w, 11 * w, w);
    rect(b - 29 * w, A + 15 * w, 11 * w, 10 * w);
    rect(b - 16 * w, A + 6 * w, 16 * w, 2 * w);
    rect(b - 16 * w, A + 13 * w, 16 * w, w);
    rect(b - 16 * w, A + 16 * w, 16 * w, 8 * w);
    for (int q = b - 16 * w; q < b; q += 2 * w) {
        rect(q, A + 25 * w, w, w);
        rect(q + w, A + 24 * w, w, w);
        rect(q + w, A + 26 * w, w, w);
}
    for (int p = b - 29 * w; p < b - w * 20; p += 2 * w) {
        rect(p, A + 26 * w, w, w);
        rect(p, A + 28 * w, w, w);
        rect(p + w, A + 25 * w, w, w);
        rect(p + w, A + 27 * w, w, w);
}
    rect(b - 19 * w, A + 26 * w, w, w);
    rect(b - 19 * w, A + 28 * w, w, w);
}
void rightdokan() {
    //土管　右
    rotate(PI);
    b = 0;
    A =-  500;
    fill(0);
    rect(b - 16 * w, A + 2 * w, 16 * w, w);
    rect(b - 16 * w, A + 29 * w, 16 * w, w);
    rect(b - 17 * w, A + 2 * w, w, 28 * w);
    rect(b - 18 * w, A, w, 32 * w);
    rect(b - 32 * w, A, w, 32 * w);
    rect(b - 31 * w, A, 13 * w, w);
    rect(b - 32 * w, A + 31 * w, 14 * w, w);
    
    fill(139, 214, 0);
    rect(b - 31 * w, A + w, 13 * w, 30 * w);
    rect(b - 16 * w, A + 3 * w, 16 * w, 26 * w);
    
    fill(15, 150, 0);
    rect(b - 30 * w, A + w, w, 5 * w);
    rect(b - 30 * w, A + 12 * w, w, 19 * w);
    rect(b - 29 * w, A + 4 * w, 11 * w, 2 * w);
    rect(b - 29 * w, A + 12 * w, 11 * w, w);
    rect(b - 29 * w, A + 15 * w, 11 * w, 10 * w);
    rect(b - 16 * w, A + 6 * w, 16 * w, 2 * w);
    rect(b - 16 * w, A + 13 * w, 16 * w, w);
    rect(b - 16 * w, A + 16 * w, 16 * w, 8 * w);
    for (int q = b - 16 * w; q < b; q += 2 * w) {
        rect(q, A + 25 * w, w, w);
        rect(q + w, A + 24 * w, w, w);
        rect(q + w, A + 26 * w, w, w);
}
    for (int p = b - 29 * w; p < b - w * 20; p += 2 * w) {
        rect(p, A + 26 * w, w, w);
        rect(p, A + 28 * w, w, w);
        rect(p + w, A + 25 * w, w, w);
        rect(p + w, A + 27 * w, w, w);
}
    rect(b - 19 * w, A + 26 * w, w, w);
    rect(b - 19 * w, A + 28 * w, w, w);
    rotate(PI);
}


void draw() {
    background(95, 146, 255);
    blocks();
    noStroke();
    
    //マリオ　左右移動
    if (keyPressed) {
        
        if (keyCode ==  RIGHT) {
            mx += s;
        } else if (keyCode ==  LEFT) {
            mx -= s;
        }
        
}
    //重力///////////////////////////////
    int g = 1500;
    if(my >=  500) {
        g = 0;
        t = 0;
        v = 0;
        Y0 = my;
        my = 500;
        swich = 0;
} else {
        t += 0.017;
        g = 1500;
}
    //マリオ　ジャンプ
    if((mousePressed )) {
        v = 1000;
        Y0 = 499;
        swich = 1;
}
    if(Y < 500) {
        if (keyPressed) {
            if (keyCode ==  RIGHT) {
                mx += s;
            } else if (keyCode ==  LEFT) {
                mx -= s;
            }
        } else{
            mx += 0;
        }   
} 
    
    //クリボー　当たり判定
    kx = kx - kv;
    //踏むとき
    if((kx - 7 * w <=  mx) &&  (mx<= kx + 7 * w) &&  (ky - 15 * w<= my) &&  (ky - 14 * w>= my)) {
        kx =-  50;//クリボーの消去
        v = 1000;//ジャンプの初期設定
        Y0 = 500 - 15 * w;
        t = 0;
        g = 1500;
}
    //クリボーにやられる
    if((kx - 7 * w <=  mx) &&  (mx<= kx + 7 * w) &&  (ky - 13 * w<= my)) {
        mx = w * 48;//マリオの初期化
        kx = 1500;//クリボーの初期化
}
    //クリボー挙動
    if(kx < 32 * w ||  1800 - 32 * w < kx) {
        kv =-  kv;
}
    kuribou(kx,ky);
    
    if (mx < 0 - 16 * w ||  1800 + 16 * w < mx) {
        mx = w * 48;//マリオの初期化
        kx = 1500;//クリボーの初期化
        my = 500;
}
    leftdokan();
    rightdokan();
    //土管に入る
    if (mx > 1800 - 32 * w &&  my > 500 - 30 * w) {
        mx = 32 * w;
        kx = 1500;
        kv = 2;
}
    ////土管判定
    if (((mx < 32 * w) ||  (1800 - 32 * w<mx)) &&  (my>= 500 - 34 * w) &&  (my<= 500 - 31 * w)) {
        g = 0;
        Y0 = 500 - 31 * w;
        v = 0;
        t = 0;
        swich = 0;
}
    if ((mousePressed ) &&  my ==  500 - 31 * w) {
        v = 1000;
        Y0 = 100;
        swich = 1;
        g = 1700;
        t = 0.017;
    }
    
    
    if (mx < 32 * w &&  my > 500 - 30 * w) {
        mx = 1800 - 32 * w;
        kx = 1500;
        kv = 2;
}
    //マリオY座表   
    my = 0;
    my = 0.5 * g * t * t - v * t + Y0;
    if(swich ==  1) {
        mariojump(mx,my);
} else{
        mario(mx,my);
}
    
}