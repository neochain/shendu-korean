.class public Lcom/shendu/utils/BrowserUtils;
.super Ljava/lang/Object;
.source "BrowserUtils.java"


# static fields
.field protected static final ACCEPTED_URI_SCHEMA:Ljava/util/regex/Pattern;

.field private static android_browser:[Ljava/lang/String;

.field private static bUtils:Lcom/shendu/utils/BrowserUtils;

.field private static tentcent:[Ljava/lang/String;

.field private static uc:[Ljava/lang/String;


# instance fields
.field private final contentResolver:Landroid/content/ContentResolver;

.field private final context:Landroid/content/Context;

.field private scaleXY:F


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 38
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "com.android.browser"

    aput-object v1, v0, v2

    const-string v1, "com.android.browser.BrowserActivity"

    aput-object v1, v0, v3

    sput-object v0, Lcom/shendu/utils/BrowserUtils;->android_browser:[Ljava/lang/String;

    .line 39
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "com.tencent.mtt"

    aput-object v1, v0, v2

    const-string v1, "com.tentcent.mtt.MainActivity"

    aput-object v1, v0, v3

    sput-object v0, Lcom/shendu/utils/BrowserUtils;->tentcent:[Ljava/lang/String;

    .line 40
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "com.UCMobile"

    aput-object v1, v0, v2

    const-string v1, "com.UCMobile.main.UCMobile"

    aput-object v1, v0, v3

    sput-object v0, Lcom/shendu/utils/BrowserUtils;->uc:[Ljava/lang/String;

    .line 245
    const-string v0, "(?i)((?:http|https|file):\\/\\/|(?:inline|data|about|javascript):)(.*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/shendu/utils/BrowserUtils;->ACCEPTED_URI_SCHEMA:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/high16 v0, 0x42a0

    iput v0, p0, Lcom/shendu/utils/BrowserUtils;->scaleXY:F

    .line 47
    iput-object p1, p0, Lcom/shendu/utils/BrowserUtils;->context:Landroid/content/Context;

    .line 48
    iget-object v0, p0, Lcom/shendu/utils/BrowserUtils;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/shendu/utils/BrowserUtils;->contentResolver:Landroid/content/ContentResolver;

    .line 49
    return-void
.end method

.method private fillList(Landroid/database/Cursor;)Ljava/util/List;
    .locals 12
    .parameter "cur"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/shendu/domain/BrowserData;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 183
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 184
    .local v9, list:Ljava/util/List;,"Ljava/util/List<Lcom/shendu/domain/BrowserData;>;"
    if-nez p1, :cond_0

    .line 216
    :goto_0
    return-object v9

    .line 187
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 189
    :cond_1
    new-instance v8, Lcom/shendu/domain/BrowserData;

    invoke-direct {v8}, Lcom/shendu/domain/BrowserData;-><init>()V

    .line 192
    .local v8, data:Lcom/shendu/domain/BrowserData;
    const-string v2, "favicon"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    .line 193
    .local v7, buf:[B
    if-eqz v7, :cond_4

    .line 194
    array-length v2, v7

    invoke-static {v7, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 198
    .local v0, favicon:Landroid/graphics/Bitmap;
    :goto_1
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 199
    .local v5, matrix:Landroid/graphics/Matrix;
    iget v2, p0, Lcom/shendu/utils/BrowserUtils;->scaleXY:F

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    iget v3, p0, Lcom/shendu/utils/BrowserUtils;->scaleXY:F

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 201
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 203
    invoke-virtual {v8, v0}, Lcom/shendu/domain/BrowserData;->setFavicon(Landroid/graphics/Bitmap;)V

    .line 204
    const-string v2, "title"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 205
    .local v10, title:Ljava/lang/String;
    const-string v2, "url"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 206
    .local v11, url:Ljava/lang/String;
    if-eqz v10, :cond_2

    if-nez v11, :cond_5

    .line 213
    :cond_2
    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 215
    .end local v0           #favicon:Landroid/graphics/Bitmap;
    .end local v5           #matrix:Landroid/graphics/Matrix;
    .end local v7           #buf:[B
    .end local v8           #data:Lcom/shendu/domain/BrowserData;
    .end local v10           #title:Ljava/lang/String;
    .end local v11           #url:Ljava/lang/String;
    :cond_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 196
    .restart local v7       #buf:[B
    .restart local v8       #data:Lcom/shendu/domain/BrowserData;
    :cond_4
    iget-object v2, p0, Lcom/shendu/utils/BrowserUtils;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f02000f

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .restart local v0       #favicon:Landroid/graphics/Bitmap;
    goto :goto_1

    .line 209
    .restart local v5       #matrix:Landroid/graphics/Matrix;
    .restart local v10       #title:Ljava/lang/String;
    .restart local v11       #url:Ljava/lang/String;
    :cond_5
    invoke-virtual {v8, v10}, Lcom/shendu/domain/BrowserData;->setTitie(Ljava/lang/String;)V

    .line 210
    invoke-virtual {v8, v11}, Lcom/shendu/domain/BrowserData;->setUrl(Ljava/lang/String;)V

    .line 212
    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public static fixUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "inUrl"

    .prologue
    .line 289
    const/16 v4, 0x3a

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 290
    .local v2, colon:I
    const/4 v0, 0x1

    .line 291
    .local v0, allLower:Z
    const/4 v3, 0x0

    .local v3, index:I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 292
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 293
    .local v1, ch:C
    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v4

    if-nez v4, :cond_2

    .line 302
    .end local v1           #ch:C
    :cond_0
    const-string v4, "http://"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "https://"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 310
    :cond_1
    :goto_1
    return-object p0

    .line 296
    .restart local v1       #ch:C
    :cond_2
    invoke-static {v1}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v4

    and-int/2addr v0, v4

    .line 297
    add-int/lit8 v4, v2, -0x1

    if-ne v3, v4, :cond_3

    if-nez v0, :cond_3

    .line 298
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 291
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 304
    .end local v1           #ch:C
    :cond_4
    const-string v4, "http:"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "https:"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 306
    :cond_5
    const-string v4, "http:/"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "https:/"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 307
    :cond_6
    const-string v4, "/"

    const-string v5, "//"

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 308
    :cond_7
    const-string v4, ":"

    const-string v5, "://"

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1
.end method

.method public static getUtils(Landroid/content/Context;)Lcom/shendu/utils/BrowserUtils;
    .locals 1
    .parameter "context"

    .prologue
    .line 56
    sget-object v0, Lcom/shendu/utils/BrowserUtils;->bUtils:Lcom/shendu/utils/BrowserUtils;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Lcom/shendu/utils/BrowserUtils;

    invoke-direct {v0, p0}, Lcom/shendu/utils/BrowserUtils;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/shendu/utils/BrowserUtils;->bUtils:Lcom/shendu/utils/BrowserUtils;

    .line 59
    :cond_0
    sget-object v0, Lcom/shendu/utils/BrowserUtils;->bUtils:Lcom/shendu/utils/BrowserUtils;

    return-object v0
.end method

.method public static smartUrlFilter(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "url"

    .prologue
    const/4 v5, 0x1

    .line 259
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 260
    .local v1, inUrl:Ljava/lang/String;
    const/16 v6, 0x20

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_2

    move v0, v5

    .line 262
    .local v0, hasSpace:Z
    :goto_0
    sget-object v6, Lcom/shendu/utils/BrowserUtils;->ACCEPTED_URI_SCHEMA:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 263
    .local v3, matcher:Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 265
    invoke-virtual {v3, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 266
    .local v4, scheme:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 267
    .local v2, lcScheme:Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 268
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 270
    :cond_0
    if-eqz v0, :cond_1

    .line 271
    const-string v5, " "

    const-string v6, "%20"

    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    :cond_1
    move-object v5, v1

    .line 281
    .end local v2           #lcScheme:Ljava/lang/String;
    .end local v4           #scheme:Ljava/lang/String;
    :goto_1
    return-object v5

    .line 260
    .end local v0           #hasSpace:Z
    .end local v3           #matcher:Ljava/util/regex/Matcher;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 275
    .restart local v0       #hasSpace:Z
    .restart local v3       #matcher:Ljava/util/regex/Matcher;
    :cond_3
    if-nez v0, :cond_4

    .line 276
    sget-object v5, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 277
    invoke-static {v1}, Landroid/webkit/URLUtil;->guessUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 281
    :cond_4
    const-string v5, "http://www.google.com"

    const-string v6, "%s"

    invoke-static {v1, v5, v6}, Landroid/webkit/URLUtil;->composeSearchUrl(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1
.end method


# virtual methods
.method public cleanHistory()V
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/shendu/utils/BrowserUtils;->contentResolver:Landroid/content/ContentResolver;

    invoke-static {v0}, Landroid/provider/Browser;->clearHistory(Landroid/content/ContentResolver;)V

    .line 146
    return-void
.end method

.method public delBookmark(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "title"
    .parameter "url"

    .prologue
    .line 109
    iget-object v0, p0, Lcom/shendu/utils/BrowserUtils;->contentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Browser;->BOOKMARKS_URI:Landroid/net/Uri;

    const-string v2, "title=? and url=?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 113
    return-void
.end method

.method public delBookmarkList(Ljava/util/Map;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p1, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 129
    :cond_0
    return-void

    .line 121
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 122
    .local v0, entry:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz v0, :cond_0

    .line 123
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 124
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 125
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 126
    .local v2, kv:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Lcom/shendu/utils/BrowserUtils;->delBookmark(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public delHistory(Ljava/lang/String;)V
    .locals 3
    .parameter "url"

    .prologue
    .line 135
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/shendu/utils/BrowserUtils;->contentResolver:Landroid/content/ContentResolver;

    invoke-static {v0, p1}, Landroid/provider/Browser;->deleteFromHistory(Landroid/content/ContentResolver;Ljava/lang/String;)V

    .line 137
    const-string v0, "fastIntnet"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "del: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    :cond_0
    return-void
.end method

.method public delHistoryList(Ljava/util/Map;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 159
    .local p1, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 169
    :cond_0
    return-void

    .line 160
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 161
    .local v0, entry:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz v0, :cond_0

    .line 162
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 163
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 164
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 165
    .local v2, kv:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/shendu/utils/BrowserUtils;->delHistory(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public delMap(Ljava/util/Map;Z)V
    .locals 3
    .parameter
    .parameter "isBookmark"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 171
    .local p1, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "fastIntnet"

    if-eqz p2, :cond_0

    const-string v0, "bookmark"

    :goto_0
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    if-eqz p2, :cond_1

    .line 173
    invoke-virtual {p0, p1}, Lcom/shendu/utils/BrowserUtils;->delBookmarkList(Ljava/util/Map;)V

    .line 176
    :goto_1
    return-void

    .line 171
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "history del.map.size:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 175
    :cond_1
    invoke-virtual {p0, p1}, Lcom/shendu/utils/BrowserUtils;->delHistoryList(Ljava/util/Map;)V

    goto :goto_1
.end method

.method public openUrl(Ljava/lang/String;)V
    .locals 6
    .parameter "url"

    .prologue
    const/4 v5, 0x0

    .line 225
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 226
    .local v1, intent:Landroid/content/Intent;
    const/high16 v2, 0x3000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 228
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 229
    sget-object v2, Lcom/shendu/utils/BrowserUtils;->android_browser:[Ljava/lang/String;

    aget-object v2, v2, v5

    sget-object v3, Lcom/shendu/utils/BrowserUtils;->android_browser:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 231
    :try_start_0
    iget-object v2, p0, Lcom/shendu/utils/BrowserUtils;->context:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    :goto_0
    return-void

    .line 232
    :catch_0
    move-exception v0

    .line 233
    .local v0, e:Landroid/content/ActivityNotFoundException;
    iget-object v2, p0, Lcom/shendu/utils/BrowserUtils;->context:Landroid/content/Context;

    const v3, 0x7f070012

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 234
    const-string v2, "fastIntnet"

    const-string v3, "catch android.content.ActivityNotFoundException: can\'t open select browser"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    new-instance v1, Landroid/content/Intent;

    .end local v1           #intent:Landroid/content/Intent;
    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 236
    .restart local v1       #intent:Landroid/content/Intent;
    const/high16 v2, 0x5000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 237
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 238
    iget-object v2, p0, Lcom/shendu/utils/BrowserUtils;->context:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public queryBookmark()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/shendu/domain/BrowserData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcom/shendu/utils/BrowserUtils;->contentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Browser;->BOOKMARKS_URI:Landroid/net/Uri;

    sget-object v2, Landroid/provider/Browser;->HISTORY_PROJECTION:[Ljava/lang/String;

    const-string v3, "bookmark = 1"

    const/4 v4, 0x0

    const-string v5, "_id"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 73
    .local v6, cursor:Landroid/database/Cursor;
    invoke-direct {p0, v6}, Lcom/shendu/utils/BrowserUtils;->fillList(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public queryHistory()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/shendu/domain/BrowserData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lcom/shendu/utils/BrowserUtils;->contentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/Browser;->BOOKMARKS_URI:Landroid/net/Uri;

    sget-object v2, Landroid/provider/Browser;->HISTORY_PROJECTION:[Ljava/lang/String;

    const-string v3, "visits > 0 AND date > 0"

    const/4 v4, 0x0

    const-string v5, "date DESC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 87
    .local v6, cursor:Landroid/database/Cursor;
    invoke-direct {p0, v6}, Lcom/shendu/utils/BrowserUtils;->fillList(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
